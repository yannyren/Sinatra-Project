require_relative('../db/sql_runner')
require ("pry-byebug")

class Student

  attr_reader :id, :name, :gender, :cohort, :graduation_date, :picture

  def initialize(options)
    @name = options["name"]
    @gender = options["gender"]
    @cohort = options["cohort"]
    @graduation_date = options["graduation_date"]
    @picture = options["picture"]
    @id = options["id"].to_i if options["id"]
  end 

  def save()
    sql = "INSERT INTO students (name, gender, cohort, graduation_date) VALUES ('#{@name}', '#{@gender}', '#{@cohort}', '#{@graduation_date}') RETURNING id;"
    result = SqlRunner.run(sql) 
    @id = result[0]["id"].to_i
  end 

  def update()
    sql = "Update students 
    SET name = '#{@name}', 
    gender = '#{@gender}', 
    cohort = '#{@cohort}', 
    graduation_date ='#{@graduation_date}',
    picture = '#{@picture}'
    WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end 

  def company()
    sql = "SELECT companies.* 
          FROM companies 
          INNER JOIN jobs
          ON jobs.company_id = companies.id
          WHERE jobs.student_id = #{@id};"
          # binding.pry
    result = SqlRunner.run(sql).first
    result ? Company.new(result) : Company.new({})
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
