import pyodbc
#DRIVER={SQL Server};SERVER=srvm4sql;DATABASE=RelojesITK_GCO;UID=m4prod;PWD=Obelix2014
class SQLServerDatabase:
    def __init__(self, server, database, username, password):
        self.server = server
        self.database = database
        self.username = username
        self.password = password
        self.connection = self._create_connection()

    def _create_connection(self):
        connection_string = (
            f'DRIVER={{SQL Server}};'
            f'SERVER={self.server};DATABASE={self.database};'
            f'UID={self.username};PWD={self.password}'
        )
        return pyodbc.connect(connection_string)

    def execute_query(self, query):
        cursor = self.connection.cursor()
        cursor.execute(query)
        cursor.commit()

    def fetch_data(self, query):
        cursor = self.connection.cursor()
        cursor.execute(query)
        return cursor.fetchall()

    def close_connection(self):
        self.connection.close()


