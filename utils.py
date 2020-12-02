import pymysql.cursors


def show_offers():
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 db='travel_agency')

    try:
        connection.commit()

        with connection.cursor() as cursor:
            sql = "SELECT * FROM `offer`"
            cursor.execute(sql)
            rows = cursor.fetchall()
            desc = cursor.description

            for d in desc:
                print(f'{d[0]:6}', end=' ')
            print()
            # print(f'{desc[0][0]:<8} {desc[1][0]:<8} {desc[2][0]:>5}')

            for row in rows:
                for i in range(0, len(row)):
                    print(row[i], end="\t")
                print()
    finally:
        connection.close()

def show_client_info():
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 db='travel_agency')

    try:
        connection.commit()

        with connection.cursor() as cursor:
            sql = "SELECT * FROM `client`"
            cursor.execute(sql)
            rows = cursor.fetchall()
            desc = cursor.description

            for d in desc:
                print(f'{d[0]:6}', end=' ')
            print()
            # print(f'{desc[0][0]:<8} {desc[1][0]:<8} {desc[2][0]:>5}')

            for row in rows:
                for i in range(0, len(row)):
                    print(row[i], end="\t")
                print()
    finally:
        connection.close()

