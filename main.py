import pymysql.cursors
import interfaces

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
            interfaces.client_interface()
        elif(choice == "2"):
            interfaces.employee_interface()

finally:
    connection.close()

