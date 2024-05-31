#include <stdio.h>
#include <conio.h>
#include <alloc.h>
#include <process.h>
#include <dos.h>
#include <stdlib.h>
#include <string.h>
#define p printf
#define s scanf

typedef struct d {
		 char nombre[25];
		 char ap[25];
		 char dir[50];
		 char fnac[8];
		 char telfijo[12];
		 char telmovil[12];
		 char tellab[12];
		 char email[40];
		 };

typedef struct s_nodo {
		      d datos;
		      s_nodo *next;
		      int act;
		      int en;
		      }tnodo;

void place (tnodo*, tnodo ***);
void leo(tnodo **);
void guardo (tnodo **);
void alta (tnodo **);
void baja(tnodo *);
void modifica (tnodo *);
void con_nom (tnodo *);
void con_tod (tnodo *);
void exporto (tnodo *);
void main (void)
{
int sa1=0,sa2=0, sa3=0, op;
tnodo *h=NULL;
leo(&h);
do
 {
 clrscr();
 p("----------AGENDA 1.0----------\n");
 p("     1- ABM Datos\n");
 p("     2- Consulta\n");
 p("     3- Backup de informacion\n");
 p("     4- Salir del programa\n");
 p("------------------------------\n");
 s("%d", &op);
 switch(op) {
	    case 1:
		  do {
		     clrscr();
		     p("----------ABM Datos----------\n");
		     p("     1- Alta\n");
		     p("     2- Baja\n");
		     p("     3- Modificacion\n");
		     p("     4- Volver al menu anterior\n");
		     p("------------------------------\n");
		     s("%d", &op);
		     switch(op) {
				 case 1:
				       alta(&h);
				 break;
				 case 2:
				       baja(h);
				 break;
				 case 3:
				       modifica(h);
				 break;
				 case 4:
				       sa2=1;
				 break;
				 default:
					p("Ingrese una opcion valida\n");
				 break;
				 }
		     }
		  while(sa2==0);
	    break;
	    case 2:
		  do {
		     clrscr();
		     p("----------Consultas----------\n");
		     p("     1- Buscar por nombre\n");
		     p("     2- Listar Todos\n");
		     p("     3- Exportar\n");
		     p("     4- Volver al menu anterior\n");
		     p("------------------------------\n");
		     s("%d", &op);
		     switch(op) {
				case 1:
				      con_nom(h);
				break;
				case 2:
				      con_tod(h);
				break;
				case 3:
				      exporto(h);
				break;
				case 4:
				      sa3=1;
				break;
				default:
				       p("Ingrese una opcion valida\n");
				break;
				}
		     }
		  while(sa3==0);
	    break;
	    case 3:
	    break;
	    case 4:
		  sa1=1;
	    break;
	    default:
		   p("Ingrese una opcion valida\n");
	    break;
	    }
 }
while(sa1==0);
}

void con_tod (tnodo *h)
{
int cont=0;
clrscr();
p("------------------------------\n");
do {
   if (h->act==1)
      {
      cont++;
      p("Nombre: %s\n", h->datos.nombre);
      p("Apellido: %s\n", h->datos.ap);
      p("Direccion: %s\n", h->datos.dir);
      p("Fecha de NAC: %s\n", h->datos.fnac);
      p("Tel. Part.:%s\n", h->datos.telfijo);
      p("Tel. Movil: %s\n", h->datos.telmovil);
      p("Tel. Lab: %s\n", h->datos.tellab);
      p("E-Mail: %s\n", h->datos.email);
      p("------------------------------\n");
      getch();
      }
      if(cont==2)
	 {
	 p("\n\n\n\t\t\tPresione una tecla para continuar\n");
	 getch();
	 cont=0;
	 clrscr();
	 p("------------------------------\n");
	 }

      h=h->next;
      }
while(h);
p("------------------------------\n");
}

void con_nom (tnodo *h)
{
tnodo *tmp;
tmp=h;
char nom[25];
int cont=0;
p("Ingrese el nombre\n");
fflush(stdin);
gets(nom);
p("Entradas encontradas\n");
while(tmp)
     {
     tmp->en=0;
     tmp=tmp->next;
     }
tmp=h;
while(tmp)
     {
     if(strlen(tmp->datos.nombre) == strlen(nom))
       {
       cont++;
       tmp->en=cont;
       p("Registro: %d, %s, %s\n", cont, tmp->datos.nombre, tmp->datos.ap);
       }
     tmp=tmp->next;
     }
getch();
if(cont>1)
  {
  p("Ingrese el numero de registro que desea consultar\n");
  s("%d", &cont);
  }
tmp=h;
do
 {
 if (cont==tmp->en)
    {
    clrscr();
    p("------------------------------\n");
    p("Nombre: %s\n", tmp->datos.nombre);
    p("Apellido: %s\n", tmp->datos.ap);
    p("Direccion: %s\n", tmp->datos.dir);
    p("Fecha de NAC: %s\n", h->datos.fnac);
    p("Tel. Part.:%s\n", tmp->datos.telfijo);
    p("Tel. Movil: %s\n", h->datos.telmovil);
    p("Tel. Lab: %s\n", tmp->datos.tellab);
    p("E-Mail: %s\n", tmp->datos.email);
    p("------------------------------\n");
    getch();
    break;
    }
 tmp=tmp->next;
 }
while(tmp);
}

void leo(tnodo **h)
{
tnodo *nodo;
FILE *flujo;
clrscr();
if(!(flujo = fopen("c:\\datosag.dat", "r")))
  {
  p("ATENCION!: No se puede abrir el archivo, se generara uno nuevo en c:\\n");
  getch();
  }
else
   {
   do {
      if (!(nodo=(tnodo*)malloc(sizeof(tnodo)))) exit(1);
      fread(&nodo->datos,sizeof(nodo->datos),1,flujo);
      nodo->act=1;
      nodo->en=0;
      if(feof(flujo)) break;
      place(nodo, &h);
      }
   while(!feof(flujo));
   fclose(flujo);
   }
}

void place (tnodo *nodo,tnodo ***h)
{
tnodo *anterior, *actual, **tmp;
tmp=*h;
if (!*tmp)
   {
   nodo->next=NULL;
   *tmp=nodo;
   }
   else
      {
      anterior=*tmp;
      actual=*tmp;
      while (actual)
	    {
	    anterior=actual;
	    actual=actual->next;
	    };
      anterior->next=nodo;
      nodo->next=NULL;
     }
}

void guardo (tnodo **h)
{
FILE *flujo;
tnodo *tmp;
tmp=*h;
if(!(flujo=fopen("C:\\datosag.dat", "wb")))
  {
  p("No se puede generar el archivo\n");
  }
else
   {
   do
    {
    if(tmp->act==1)
      {
      fwrite(&tmp->datos,sizeof(tmp->datos),1,flujo);
      }
    tmp=tmp->next;
    }
  while(tmp);
  fclose(flujo);
   }
}

void alta (tnodo **h)
{
tnodo *nodo;
char cnd;
do {
   clrscr();
   p("*----Alta de entradas----*\n");
   if (! (nodo = (tnodo*) malloc(sizeof(tnodo)) ) ) exit (1);
   p("Nombre\n");
   fflush(stdin);
   gets(nodo->datos.nombre);
   p("Apellido\n");
   s("%s", &nodo->datos.ap);
   p("Direccion\n");
   fflush(stdin);
   gets(nodo->datos.dir);
   p("Fecha de Nacimiento DD/MM/AA\n");
   fflush(stdin);
   gets(nodo->datos.fnac);
   p("Telefono Fijo\n");
   fflush(stdin);
   gets(nodo->datos.telfijo);
   p("Telefono Movil\n");
   fflush(stdin);
   gets(nodo->datos.telmovil);
   p("Telefono Laboral\n");
   fflush(stdin);
   gets(nodo->datos.tellab);
   p("E-Mail\n");
   fflush(stdin);
   gets(nodo->datos.email);
   nodo->act=1;
   place(nodo, &h);
   p("Desea seguir ingresando entradas? s/n\n");
   s("%c", &cnd);
   }
while (cnd=='s');
guardo(h);
}


void baja(tnodo *h)
{
tnodo *tmp;
tmp=h;
char nom[25];
int cont=0;
p("Ingrese el nombre\n");
fflush(stdin);
gets(nom);
p("Entradas encontradas\n");
while(tmp)
     {
     tmp->en=0;
     tmp=tmp->next;
     }
tmp=h;
while(tmp)
     {
     if(strlen(tmp->datos.nombre) == strlen(nom))
       {
       cont++;
       tmp->en=cont;
       p("Registro: %d, %s, %s\n", cont, tmp->datos.nombre, tmp->datos.ap);
       }
     tmp=tmp->next;
     }
getch();
if(cont>1)
  {
  p("Ingrese el numero de registro que desea eliminar\n");
  s("%d", &cont);
  }
tmp=h;
do
 {
 if (cont==tmp->en)
    {
    tmp->act=0;
    }
 tmp=tmp->next;
 }
while(tmp);
guardo(&h);
}

void modifica (tnodo *h)
{
tnodo *tmp;
tmp=h;
char nom[25], cnd;
int cont=0, campo, bnd=0;
p("Ingrese el nombre\n");
fflush(stdin);
gets(nom);
p("Entradas encontradas\n");
while(tmp)
     {
     tmp->en=0;
     tmp=tmp->next;
     }
tmp=h;
while(tmp)
     {
     if(strlen(tmp->datos.nombre) == strlen(nom))
       {
       cont++;
       tmp->en=cont;
       p("Registro: %d, %s, %s\n", cont, tmp->datos.nombre, tmp->datos.ap);
       }
     tmp=tmp->next;
     }
getch();
if(cont>1)
  {
  p("Ingrese el numero de registro que desea modificar\n");
  s("%d", &cont);
  }
tmp=h;
do
 {
 if (cont==tmp->en)
    {
    do {
       clrscr();
       p("*--Datos Anteriores--*\n");
       p("1-Nombre: %s\n", tmp->datos.nombre);
       p("2-Apellido: %s\n", tmp->datos.ap);
       p("3-Direccion: %s\n", tmp->datos.dir);
       p("4-Fecha de Nac: %s\n", tmp->datos.fnac);
       p("5-Tel Fijo: %s\n", tmp->datos.telfijo);
       p("6-Tel Movil: %s\n", tmp->datos.telmovil);
       p("7-Tel Laboral: %s\n", tmp->datos.tellab);
       p("8-E-Mail: %s\n", tmp->datos.email);

       p("Ingrese el numero del campo que desea modificar\n");
       s("%d", &campo);
       switch(campo) {
		     case 1:
			   p("Ingrese Nombre\n");
			   fflush(stdin);
			   gets(tmp->datos.nombre);
		     break;
		     case 2:
			   p("Ingrese Apellido\n");
			   fflush(stdin);
			   gets(tmp->datos.ap);
		     break;
		     case 3:
			   p("Ingrese Direccion\n");
			   fflush(stdin);
			   gets(tmp->datos.dir);
		     break;
		     case 4:
			   p("Ingrese F. de NAC\n");
			   fflush(stdin);
			   gets(tmp->datos.fnac);
		     break;
		     case 5:
			   p("Ingrese Telefono Fijo\n");
			   fflush(stdin);
			   gets(tmp->datos.telfijo);
		     break;
		     case 6:
			   p("Ingrese Telefono Movil\n");
			   fflush(stdin);
			   gets(tmp->datos.telmovil);
		     break;
		     case 7:
			   p("Ingrese Telefono Laboral\n");
			   fflush(stdin);
			   gets(tmp->datos.tellab);
		     break;
		     case 8:
			   p("Ingrese E-mail\n");
			   fflush(stdin);
			   gets(tmp->datos.email);
		     break;
		     default:
			    p("Ingrese una opcion valida\n");
		     break;
		     }
	 p("Desea modificar otro campo? s/n\n");
	 s("%c", &cnd);
	 }
      while(cnd=='s');
      bnd=1;
      }
   tmp=tmp->next;
   }
while(tmp&&bnd==0);
if(bnd==1)guardo(&h);
}

void exporto (tnodo *h)
{
FILE *flujo;

if(!(flujo=fopen("C:\\BKUPDTS.txt", "w+")))
  {
  p("No se puede generar el archivo\n");
  }
else
   {
   fprintf(flujo, "------------------------------\n");
   do
    {
    if(h->act==1)
      {
      fprintf(flujo, "Nombre: %s\n", h->datos.nombre);
      fprintf(flujo, "Apellido: %s\n", h->datos.ap);
      fprintf(flujo, "Direccion: %s\n", h->datos.dir);
      fprintf(flujo, "Fecha de Nac: %s\n", h->datos.fnac);
      fprintf(flujo, "Tel Fijo: %s\n", h->datos.telfijo);
      fprintf(flujo, "Tel Movil: %s\n", h->datos.telmovil);
      fprintf(flujo, "Tel Laboral: %s\n", h->datos.tellab);
      fprintf(flujo, "E-Mail: %s\n", h->datos.email);
      fprintf(flujo, "------------------------------\n");
      }
    h=h->next;
    }
  while(h);
  fclose(flujo);
   }
}

