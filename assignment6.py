#(91, 'Robert', 'Lewis', '1994-07-17', 'Wilsonborough', 'MT', '53741')
#(92, 'Kelly', 'Weber', '1999-08-01', 'Connieview', 'OK', '09271')
#(93, 'Timothy', 'Zhang', '2000-08-27', 'Porterport', 'IA', '97619')

import sqlalchemy as db
import json
# if you want to see your Customer class in action,
# change the following line to import your Customer class
from mjaco32_cust_class import Customer


def main():
	# connect and read from customer.sqlite
    engine = db.create_engine('sqlite:///customer.sqlite')
    connection = engine.connect()

    # get all the attributes from the customer table
    results = connection.execute("select * from customer")

    # create a list of customer objects
    customers = []
    for row in results:
        c = Customer(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
        customers.append(c.to_json())

    # close the database connection
    connection.close()

    # output to a json file
    with open('customers_assignment6.json', 'w') as output:
        json.dump(customers, output)


#main function call
main()
