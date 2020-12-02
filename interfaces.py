import utils


def client_interface():
    choice = input("Wybierz:\n"
                   "1. Chcę wyświetlić dostępne wycieczki\n"
                   )
    if (choice == "1"):
        utils.show_offers()


        # for row in rows:
        #   print(f'{row[0]:<8} {row[1]:<15} {row[2]:>10}')


def employee_interface():
    choice = input("Wybierz:\n"
                   "1. Chce wyświetlić dostępne wycieczki \n"
                   "2. Chcę wyświetlić dane o klientach \n")

    if choice == "1":
        utils.show_offers()
    elif (choice == "2"):
        utils.show_client_info()