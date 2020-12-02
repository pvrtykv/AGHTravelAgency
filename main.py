import pymysql.cursors

def client_interface():
    choice = input("Wybierz:\n"
          "1. Chcę wyświetlić dostępne wycieczki\n"
          )
    if (choice == "1"):
        sql = "SELECT * FROM `offer`"
        cursor.execute(sql)
        rows = cursor.fetchall()
        desc = cursor.description

        for d in desc:
            print(f'{d[0]:6}', end=' ')
        print()
        #print(f'{desc[0][0]:<8} {desc[1][0]:<8} {desc[2][0]:>5}')

        for row in rows:
            for i in range(0, len(row)):
                print(row[i], end="\t")
            print()

        #for row in rows:
         #   print(f'{row[0]:<8} {row[1]:<15} {row[2]:>10}')




connection = pymysql.connect(host='localhost',
                             user='root',
                             db='travel_agency')

try:

    connection.commit()

    with connection.cursor() as cursor:
        choice = input("Witaj w systemie obsługi Biura Podróży!\n"
                       "Wpisz numer interesującej cię opcji:\n"
                       "1. Jestem klientem\n"
                       "2. Jestem pracownikiem\n")

        if (choice == "1"):
            client_interface()
        # Read a single record
        sql = "SELECT * FROM `offer`"
        cursor.execute(sql)
        result = cursor.fetchone()

finally:
    connection.close()

