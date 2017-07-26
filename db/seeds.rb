require_relative('../models/student')
require_relative('../models/company')
require_relative('../models/type')
require_relative('../models/job')
require('pry')

Student.delete()
Company.delete()

company1 = Company.new({"name" => "Google", "location" => "Dublin", "logo" => "logo_google.png"})
company2 = Company.new({"name" => "SkyScanner", "location" => "Edinburgh", "logo" => "logo_skyscanner.png"})
company3 = Company.new({"name" => "Alibaba", "location" => "HangZhou", "logo" => "logo_alibaba.png"})
company4 = Company.new({"name" => "Uber", "location" => "San Francisco", "logo" => "logo_uber.png"})
company1.save
company2.save
company3.save
company4.save

student1 = Student.new({"name" => "Yan Ren", "gender" => "Female", "cohort" => "E14", "graduation_date" => "Oct-13-2017", "picture" => "student1.jpg"})
student2 = Student.new({"name" => "Guy Bach", "gender" => "Male", "cohort" => "E14", "graduation_date" => "Oct-13-2017", "picture" => "student2.jpg"})
student3 = Student.new({"name" => "Chris Donnelly", "gender" => "Male", "cohort" => "E14", "graduation_date" => "Oct-13-2017", "picture" => "student3.jpg"})
student4 = Student.new({"name" => "Craig Lynagh", "gender" => "Male", "cohort" => "E14", "graduation_date" => "Oct-13-2017","picture" => "student4.jpg"})
student5 = Student.new({"name" => "Charlie Chaplin", "gender" => "Male", "cohort" => "G2", "graduation_date" => "Apr-10-2017", "picture" => "student5.jpg"})
student6 = Student.new({"name" => "Andrew Arran", "gender" => "Male", "cohort" => "E14", "graduation_date" => "Oct-13-2017", "picture" => "student6.jpg"})
student7 = Student.new({"name" => "Alice Prince", "gender" => "Female", "cohort" => "G1", "graduation_date" => "Sep-16-2016", "picture" => "student7.jpg"})

student1.save
student2.save
student3.save
student4.save
student5.save
student6.save
student7.save


type1 = Type.new({"type" => "Front End"})
type2 = Type.new({"type" => "Back End"})
type3 = Type.new({"type" => "Full Stack"})
type4 = Type.new({"type" => "Product Manager"})
type5 = Type.new({"type" => "Tester"})

type1.save
type2.save
type3.save
type4.save
type5.save

job1 = Job.new({"company_id" => company1.id, "student_id" => student1.id,"type_id" => type4.id})
job2 = Job.new({"company_id" => company3.id, "student_id" => student3.id,"type_id" => type4.id})
job3 = Job.new({"company_id" => company2.id, "student_id" => student4.id,"type_id" => type3.id})
job4 = Job.new({"company_id" => company1.id, "student_id" => student2.id,"type_id" => type2.id})
job5 = Job.new({"company_id" => company3.id, "student_id" => student5.id,"type_id" => type1.id})
job6 = Job.new({"company_id" => company4.id, "student_id" => student6.id,"type_id" => type5.id})


job1.save
job2.save
job3.save
job4.save
job5.save
job6.save





binding.pry
nil
