require_relative('./route.rb')
require_relative('../db/sql_runner.rb')

class Climber

  attr_reader :id
  attr_accessor :name, :skill_level

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @skill_level = options['skill_level'].to_i
  end

  def save
    sql ="INSERT INTO climbers (name, skill_level) VALUES ('#{@name}', #{@skill_level}) RETURNING *;"
    climber = SqlRunner.run(sql)
    @id = climber[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM climbers"
    SqlRunner.run(sql)
  end

  def self.get_many(sql)
    climbers = SqlRunner.run(sql)
    result = climbers.map{|climber| Climber.new(climber)}
    return result
  end

  def routes
    sql = "SELECT routes.* FROM 
          routes INNER JOIN outings ON route_id = routes.id
          WHERE climber_id = #{@id}"
    return Route.get_many(sql)
  end

  def update
    sql ="UPDATE climbers set (name, skill_level) = ('#{@name}', #{@skill_level}) WHERE id =#{@id};"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE from climbers WHERE id =#{@id};"
    SqlRunner.run(sql)
  end

  def self.find_by_id(search_id)
    sql = "SELECT * FROM climbers where id = #{search_id};"
    climber = SqlRunner.run(sql).first
    return Climber.new(climber)
  end

end
