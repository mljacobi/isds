from datetime import datetime
from dateutil.relativedelta import relativedelta


class Customer:

    student_name = 'Matt Jacobi'

    def __init__(self, id, fname, lname,dob,city,state,zip):
        self.id = id
        self.first_name = fname
        self.last_name = lname
        self.dob = dob
        self.city = city
        self.state = state
        self.zip = zip

    def full_name(first, last):
        return first + ' ' + last

    def age(self):
            dob = datetime.strptime(self.dob, '%Y-%m-%d')
            today = datetime.today()
            age = relativedelta(today, dob)
            return age.years

    def adult(self):
        return self.age() >= 18

    def to_json(self):
        j = {}
        j.update(self.__dict__)
        j ['id'] = self.id
        j ['city'] = self.city
        j ['state'] = self.state
        j ['zip'] = self.zip
        j ['age']  = self.age()
        j ['full_name'] = (self.first_name +' '+self.last_name)
        j ['adult'] = self.adult()

        return j
