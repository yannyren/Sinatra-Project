require_relative('../db/sql_runner')

class Job

  attr_reader :id, :company_id, :student_id, :type_id

  def initialize(options)
    @company_id = options["company_id"]
    @student_id = options["student_id"]
    @type_id = options["type_id"]
    @id = options["id"].to_i if options["id"]
  end 

  def save()
    sql = "INSERT INTO jobs (company_id, student_id, type_id) VALUES (#{@company_id}, #{@student_id}, #{@type_id}) RETURNING id;"
    result = SqlRunner.run(sql) 
    @id = result[0]["id"].to_i
  end 

  def update()
    sql = "UPDATE jobs 
          SET company_id = #{@company_id}, 
          student_id = #{@student_id}, 
          type_id = #{@type_id} 
          WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end 

  def company()
    sql = "SELECT * 
          FROM companies 
          WHERE #{@company_id} = companies.id;"
    result = SqlRunner.run(sql).first
    result ? Company.new(result) : Company.new({})
  end 

  def student()
    sql = "SELECT * 
          FROM students 
          WHERE #{@student_id} = students.id;"
    result = SqlRunner.run(sql).first
    result ? Student.new(result) : Student.new({})
  end 

  def type()
    sql = "SELECT * 
          FROM types 
          WHERE #{@type_id} = types.id;"
    result = SqlRunner.run(sql).first
    result ? Type.new(result) : Type.new({})
  end 

  def delete()
    sql = "DELETE FROM jobs WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end 

  def self.all()
    sql = "SELECT * FROM jobs;"
    jobs = SqlRunner.run(sql)
    return jobs.map {|job| Job.new(job)}
  end 

  def self.find(id)
    sql = "SELECT * FROM jobs WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return Company.new(result[0])
  end 

  def self.delete(id)
    sql = "DELETE FROM jobs WHERE id = #{id};"
    return SqlRunner.run(sql)
  end 

  def self.delete()
    sql = "DELETE FROM jobs;"
    return SqlRunner.run(sql)
  end

end 
