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

end
