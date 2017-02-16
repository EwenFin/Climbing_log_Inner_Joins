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

end
