import sqlite3 as sl


class BuildDataBase:
    def __init__(self):
        self.connect = sl.connect('data.db')
        self.cursor = self.connect.cursor()
        self.table_query = None
        self.table_list = None

    def create_table(self, table_name):
        self.table_query = f'CREATE TABLE {table_name} (id INTEGER AUTO INCREMENT)'
        self.cursor.execute(self.table_query)

    def rename_table(self, table_name, new_table_name):
        self.table_query = f'ALTER TABLE {table_name} RENAME TO {new_table_name}'
        self.cursor.execute(self.table_query)

    def add_column_to_table(self, table_name, column_name):
        self.table_query = f'ALTER TABLE {table_name} ADD COLUMN {column_name} BLOB'
        self.cursor.execute(self.table_query)

    def insert_values_into_table(self, table_name, value):
        self.table_query = f'INSERT INTO {table_name} VALUES ({value})'
    
    def update_values_in_table(self, table_name):
        self.table_query = f'UPDATE {table_name} SET ()'

    def print_elements_of_table(self, table_name):
        self.table_query = f'SELECT * FROM {table_name}'
        #self.table_list = self.cursor.execute(self.table_query)
        for row in self.cursor.execute(self.table_query):
            print(row)

if __name__ == '__main__':

    build = BuildDataBase()

    try:
        build.create_table('test')
        #build.add_column_to_table('test', 'miasto')
        #build.print_elements_of_table('test')
        #build.insert_values_into_table('test', 'Berlin')
        print('Task completed successfuly.')
        build.connect.commit()
        build.connect.close()

    except Exception as e:
        print(e)
