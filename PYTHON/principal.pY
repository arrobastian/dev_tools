import requests
import pandas as pd
from conexion import SQLServerDatabase
import json
import datetime
import concurrent.futures


# Crear una instancia de la clase
database = SQLServerDatabase(
    server='TU_SERVIDOR',
    database='TU_DDBB',
    username='TU_USUARIO',
    password='TU_CONTRASEÑA'
)

# Ejemplo de ejecución de una consulta
query = '''
        SELECT 
			 id as id
            ,REPLACE(CONVERT(VARCHAR, cast([ficFecha] as date), 112) + CONVERT(VARCHAR, FORMAT([ficHora], 'HH:mm:ss'), 108), ':', '') AS FechaYHoraStr
	        ,CASE 
			    WHEN ficES12 in ('E','1') THEN 'Ingreso'
			    WHEN ficES12 in ('S','2') THEN 'Salida'
			    ELSE 'Otro'
		    END AS EntradaSalida 
            ,LTRIM(STR(cast(l.legLegajo as INT))) as legajo
			,f.Enviado as enviado
        FROM [TU_DDBB].[dbo].[TU_TABLA] as f
        LEFT JOIN [TU_DDBB].[dbo].[TU_TABLA] as n ON f.ficNodo = n.nodNumero
        LEFT JOIN [TU_DDBB].[dbo].[TU_TABLA] as l ON f.ficTarjeta = l.legTarjeta
		
		WHERE ficNodo NOT IN (122, 7, 9)
        AND Enviado = 0
		AND l.tdpCodigo <> 8
        AND l.legLegajo IS NOT NULL
        '''
data = database.fetch_data(query)

# Verificar si la lista de datos está vacía
if not data:
    print("No se encontraron datos en la primera consulta. El proceso se detiene.")
    database.close_connection()
    exit()


# Extraer el primer dato de cada tupla en formato de lista para luego cambiar estos datos de 0(no enviado) a 1(enviado)
#lista_cambios_enviados = [tupla[0] for tupla in data]
#print(lista_cambios_enviados)

# Convertir las tuplas a listas
data_lists = [list(tupla) for tupla in data]
# Creo el dataframe
columnas = ['ID', 'FechaYHoraStr', 'EntradaSalida', 'Legajo', 'Enviado']
df_marcas = pd.DataFrame(data_lists, columns=columnas)













# Finalizo datos para enviar para marcas
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------

# recupero credenciales
# Ne este fragmento se obtiene las credecinales que se encuentran en la pagina de visma *Ver documento respaldatorio de como obtenerlas (Varia por usuario)
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------


def leer_credenciales_desde_archivo(archivo):
    try:
        with open(archivo, 'r') as file:
            # Leer las líneas del archivo
            lineas = file.readlines()

            # Crear un diccionario para almacenar las credenciales
            credenciales = {}
            
            # Iterar sobre las líneas y agregar al diccionario
            for linea in lineas:
                # Dividir la línea en la forma "clave = valor"
                clave, valor = linea.strip().split(' = ')
                
                # Almacenar en el diccionario
                credenciales[clave] = valor

        return credenciales.get('User'), credenciales.get('Password')
    except FileNotFoundError:
        print(f"Error: El archivo {archivo} no se encuentra.")
    except Exception as e:
        print(f"Error al leer el archivo: {e}")

# Uso de la función
archivo_credenciales = "C:\\Users\\lcano\\Desktop\\geo\\config.txt"
User, Password = leer_credenciales_desde_archivo(archivo_credenciales)

#print(f"User: {User}")
#print(f"Password: {Password}")

# termino recupero de credenciales
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------


# Utilizo credenciales para obtener token
# Con este proceso utilizo las credenciales obtenidas en el paso anterior para obtener el TOKEN que se utiliza para cualquier proceso
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------


url_login = "https://customerapi.geovictoria.com/api/v1/Login"

# Parámetros que se enviarán en la solicitud POST
parametros = {
    "user": User,
    "password": Password
}
print(parametros)
# Realizar la solicitud POST con los parámetros
response = requests.post(url_login, json=parametros)

# Verificar si la solicitud fue exitosa (código 200)
if response.status_code == 200:
    resultado = response.json()
    token = resultado.get('token')
    #print(token)


else:
    print(f"Error en la solicitud. Código de estado: {response.status_code}")




# finalizo obtencion de credenciales para obtener token
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------


# Inicio proceso para obtener DNI
# En este paso obtengo una lista de DNI y legajo para poder usar para enviar las marcas solicitadas. Se utiliza el TOKEN para poder obtener el listado
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------

url_dni = "https://customerapi.geovictoria.com/api/v1/User/List"

headers = {
        "Authorization": f"{token}"
    }


response = requests.post(url_dni, headers=headers)

# Verificar si la solicitud fue exitosa (código 2xx)
if response.ok:
    resultado = response.json()
    # Convertir la lista de diccionarios a un DataFrame
    # Seleccionar solo las columnas deseadas
    selected_columns = ["Identifier", "CustomColumn2"]
    df_personas = pd.DataFrame(resultado)[selected_columns]
else:
    print(f"Error en la solicitud. Código de estado: {response.status_code}")
    try:
        # Imprimir el contenido de la respuesta en caso de error
        error_response = response.json()
        print("Detalles del error:", error_response)
    except Exception as e:
        # En caso de que la respuesta no sea JSON, imprimir el contenido como texto
        print("Contenido del error:", response.text)






# Fianlizo proceso para obtener DNI
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
        
# Fusion de dataframe de la base de datos SQL SERVER con el dataframe de la API de GEO donde me dan el documento, relaciono por legajo
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------    



# Realizar el left join basándote en las columnas 'Legajo' y 'CustomColumn2'
result_df = pd.merge(df_marcas, df_personas, left_on='Legajo', right_on='CustomColumn2', how='left')

# Imprimir el DataFrame resultante

#df_resultado_final = result_df[['FechaYHoraStr', 'EntradaSalida', 'Identifier']]
print(result_df)
#result_df.columns = ['Date', 'Type', 'UserIdentifier']
# Convertir el DataFrame a formato JSON
json_data = result_df.to_json(orient='records', lines=True)

# Imprimir el JSON resultante
print(json_data)



# Inicio envio de marcas
# Se envian las marcas obtenidas de la tabla T_Fichadas_Temporal que sean igual a 0 y las transforma en 1
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------

url = "https://customerapi.geovictoria.com/api/v1/punch/AddArtificial"



headers = {
        "Authorization": f"{token}"
    }
# Dividir la variable en líneas para obtener cada elemento JSON
items = json_data.strip().split('\n')

# Crear una instancia de la clase
database = SQLServerDatabase(
    server='TU_SERVIDOR',
    database='TU_DDBB',
    username='TU_SUSUARIO',
    password='TU_PASSWORD'
)

# Crear una lista para almacenar los datos de actualización
actualizaciones = []

# Dividir la variable en líneas para obtener cada elemento JSON
items = json_data.strip().split('\n')


# Función para procesar una solicitud y almacenar los datos para la actualización
def procesar_solicitud(item, url, headers):
    item_dict = json.loads(item)
    id = f"{item_dict['ID']}"
    datos_solicitud = {
        "Date": f"{item_dict['FechaYHoraStr']}",
        "UserIdentifier": f"{item_dict['Identifier']}",
        "Type": f"{item_dict['EntradaSalida']}"
    }
    print("Datos de la solicitud:", datos_solicitud)

    response = requests.post(url, json=datos_solicitud, headers=headers)

    if response.ok:
        resultado = response.json()
        print("Respuesta recibida:", resultado)
        enviado = 1
        
        # Almacenar los datos para la actualización
        actualizacion = {
            "id": id,
            "enviado": enviado,
            "respuesta": resultado,
            
        }
        actualizaciones.append(actualizacion)
    else:
        print(f"Error en la solicitud. Código de estado: {response.status_code}")
        try:
            error_response = response.json()
            print("Detalles del error:", error_response)
        except Exception as e:
            print("Contenido del error:", response.text)

# Crear un ThreadPoolExecutor con 3 workers
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as executor:
    # Procesar cada elemento y realizar la solicitud en paralelo
    executor.map(procesar_solicitud, items, [url]*len(items), [headers]*len(items))

# Ahora que se han completado todas las solicitudes, realizar las actualizaciones en la base de datos
for actualizacion in actualizaciones:
    id = actualizacion['id']
    enviado = actualizacion['enviado']
    respuesta = actualizacion['respuesta']
    

    # Aquí ejecutarías la actualización en la base de datos usando los datos almacenados
    query_update = f"UPDATE [TU_DDBB].[dbo].[TU_TABLA] SET Enviado = {enviado}, respuesta = '{respuesta}', fechaHoraEnvio = GETDATE() WHERE Id = {id}"
    # Ejemplo de cómo ejecutar la consulta en la base de datos (reemplazar con tu lógica real)
    database.execute_query(query_update)
    print("Actualización realizada para ID:", id)

# No olvides cerrar la conexión cuando hayas terminado
database.close_connection()

# finalizo envio de marcas
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------












