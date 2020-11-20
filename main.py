import pymysql.cursors

connection = pymysql.connect(host='localhost',
                             user='root',
                             db='travel_agency',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

try:
    # connection is not autocommit by default. So you must commit to save
    # your changes.
    connection.commit()

    with connection.cursor() as cursor:
        # Read a single record
        sql = "SELECT * FROM `hotel`"
        cursor.execute(sql)
        result = cursor.fetchone()
        print(result)
finally:
    connection.close()

