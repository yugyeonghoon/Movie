import mysql.connector
import pandas as pd

connection = mysql.connector.connect(
    host='localhost',  
    user='root',       
    password='ezen',   
    database='movietest'   
)

cursor = connection.cursor()

cursor.execute("select * from board")  

# 결과를 pandas DataFrame으로 변환
columns = [desc[0] for desc in cursor.description]  
df = pd.DataFrame(cursor.fetchall(), columns=columns)

#df.to_csv("board_db.csv", index=False, encoding='utf-8')

print(df)

cursor.close()
connection.close()