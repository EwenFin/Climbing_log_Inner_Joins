require_relative('../db/sql_runner.rb')

class Outing

  attr_reader :id, :climber_id, :route_id
  attr_accessor :review

  def initialize(options)
    @id = options['id'].to_i
    @climber_id = options['climber_id'].to_i
    @route_id = options['route_id'].to_i
    @review = options['review']
  end

  def save()
    sql = "INSERT INTO outings (climber_id, route_id, review) VALUES (#{@climber_id}, #{@route_id}, '#{@review}') RETURNING *;"
    outing = SqlRunner.run(sql)
    @id = outing[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM outings;"
    SqlRunner.run(sql)
  end

end