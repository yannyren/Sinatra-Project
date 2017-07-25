require_relative('../models/student')
require_relative('../models/company')
require('pry')

Student.delete()
Company.delete()

company1 = Company.new({"name" => "Google", "location" => "Dublin", "logo" => "Google_logo.svg.png"})
company2 = Company.new({"name" => "SkyScanner", "location" => "Edinburgh"})
company3 = Company.new({"name" => "Alibaba", "location" => "HangZhou"})
company4 = Company.new({"name" => "Uber", "location" => "San Francisco"})
company1.save
company2.save
company3.save
company4.save

student1 = Student.new({"name" => "Yan Ren", "gender" => "Female", "cohort" => "E14", "graduation_date" => "Oct-13-2017", "company_id" => company1.id})
student2 = Student.new({"name" => "Guy Bach", "gender" => "Male", "cohort" => "E14", "graduation_date" => "Oct-13-2017", "company_id" => company2.id})
student3 = Student.new({"name" => "Chris Donnelly", "gender" => "Male", "cohort" => "E14", "graduation_date" => "Oct-13-2017", "company_id" => company3.id})
student4 = Student.new({"name" => "Craig Lynagh", "gender" => "Male", "cohort" => "E14", "graduation_date" => "Oct-13-2017", "company_id" => company4.id})
student5 = Student.new({"name" => "Charlie Chaplin", "gender" => "Male", "cohort" => "G2", "graduation_date" => "Apr-10-2017", "company_id" => company2.id})
student6 = Student.new({"name" => "Andrew Arran", "gender" => "Male", "cohort" => "E14", "graduation_date" => "Oct-13-2017", "company_id" => company4.id})
student7 = Student.new({"name" => "Alice Prince", "gender" => "Female", "cohort" => "G1", "graduation_date" => "Sep-16-2016", "company_id" => company4.id})

student1.save
student2.save
student3.save
student4.save
student5.save
student6.save
student7.save


# student1.delete
# Student.all

# Student.find(30)





binding.pry
nil
