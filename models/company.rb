require_relative('../db/sql_runner')

class Company

  attr_reader :id, :name, :location, :logo

  def initialize(options)
    @name = options["name"]
    @location = options["location"]
    @logo = options["logo"]
    @id = options["id"].to_i if options["id"]
  end 

  def save()
    sql = "INSERT INTO companies (name, location, logo) VALUES ('#{@name}','#{@location}', '#{@logo}') RETURNING id;"
    result = SqlRunner.run(sql) 
    @id = result[0]["id"].to_i
  end 

  def update()
    sql = "UPDATE companies 
          SET name = '#{@name}', 
          location = '#{@location}', 
          logo = '#{@logo}' 
          WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end 

  def delete()
    sql = "DELETE FROM companies WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end 

  def self.all()
    sql = "SELECT * FROM companies;"
    companies = SqlRunner.run(sql)
    return companies.map {|company| Company.new(company)}
  end 

  def self.find(id)
    sql = "SELECT * FROM companies WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return Company.new(result[0])
  end 

  def students
    sql = "SELECT students.* FROM companies INNER JOIN jobs ON jobs.company_id = companies.id INNER JOIN students ON jobs.student_id = students.id WHERE companies.id = #{@id};"
    students = SqlRunner.run(sql)
    return students.map {|student| Student.new(student)}
  end 

  def self.delete(id)
    sql = "DELETE FROM companies WHERE id = #{id};"
    return SqlRunner.run(sql)
  end 

  def self.delete()
    sql = "DELETE FROM companies;"
    return SqlRunner.run(sql)
  end

end 
