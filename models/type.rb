require_relative('../db/sql_runner')

class Type 
  
attr_reader :type, :id

  def initialize (options)
    @type = options["type"]
    @id = options["id"].to_i if options["id"]
  end 

  def save()
    sql = "INSERT INTO types (type) VALUES ('#{@type}') RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE types 
          SET type = '#{@type}',  
          WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end 

  def delete()
    sql = "DELETE FROM types WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end 

  def self.all()
    sql = "SELECT * FROM types;"
    types = SqlRunner.run(sql)
    return types.map {|type| Type.new(type)}
  end 

  def self.find(id)
    sql = "SELECT * FROM types WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return Type.new(result[0])
  end 

  def self.delete(id)
    sql = "DELETE FROM types WHERE id = #{id};"
    return SqlRunner.run(sql)
  end 

  def self.delete()
    sql = "DELETE FROM types;"
    return SqlRunner.run(sql)
  end

end 