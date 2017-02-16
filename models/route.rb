require_relative('./climber.rb')
require_relative('../db/sql_runner.rb')

class Route

  attr_reader :id
  attr_accessor :name, :difficulty

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @difficulty = options['difficulty'].to_i
  end

  def save
    sql = "INSERT INTO routes (name, difficulty) VALUES ('#{@name}', #{@difficulty}) RETURNING *;"
    route = SqlRunner.run(sql)
    @id = route[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM routes"
    SqlRunner.run(sql)
  end

  def self.get_many(sql)
    routes = SqlRunner.run(sql)
    result = routes.map{|route| Route.new(route)}
    return result
  end

  def climbers
    sql = "SELECT climbers.* FROM 
          climbers INNER JOIN outings ON climber_id = climbers.id WHERE route_id = #{@id}"
    return Climber.get_many(sql)
  end

  def update
    sql ="UPDATE routes set (name, difficulty) = ('#{@name}', #{@difficulty}) WHERE id =#{@id};"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE from routes WHERE id =#{@id};"
    SqlRunner.run(sql)
  end

end
