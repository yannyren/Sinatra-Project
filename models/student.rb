require_relative('../db/sql_runner')

class Student

  attr_reader :id, :name, :gender, :cohort, :company_id, :graduation_date

  def initialize(options)
    @name = options["name"]
    @gender = options["gender"]
    @cohort = options["cohort"]
    @graduation_date = options["graduation_date"]
    @company_id = options["company_id"].to_i
    @id = options["id"].to_i if options["id"]
  end 

  def save()
    sql = "INSERT INTO students (name, gender, cohort, graduation_date, company_id) VALUES ('#{@name}', '#{@gender}', '#{@cohort}', '#{@graduation_date}', #{@company_id}) RETURNING id;"
    result = SqlRunner.run(sql) 
    @id = result[0]["id"].to_i
  end 

  def update()
    sql = "Update students 
    SET (name = '#{@name}', gender = '#{@gender}', cohort = '#{@cohort}', graduation_date ='#{@graduation_date}', company_id = #{@company_id}) WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end 

  def company()
    sql = "SELECT * FROM companies WHERE id = #{@company_id};"
    return SqlRunner.run(sql)[0]["name"]
  end 

  def delete()
    sql = "DELETE FROM students WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end 

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run(sql)
    return students.map {|student| Student.new(student)}
  end 

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return Student.new(result[0])
  end 

  def self.delete(id)
    sql = "DELETE FROM students WHERE id = #{id};"
    return SqlRunner.run(sql)
  end 

  def self.delete
    sql = "DELETE FROM students;"
    return SqlRunner.run(sql)
  end 

end 
