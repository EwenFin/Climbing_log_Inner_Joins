require('pry')
require_relative('./models/climber.rb')
require_relative('./models/route.rb')
require_relative('./models/outing.rb')

Climber.delete_all
Route.delete_all
Outing.delete_all

climber1 = Climber.new({ 'name' => 'Alice', 'skill_level' => 9})
climber2 = Climber.new({ 'name' => 'Ewen', 'skill_level' => 6})
climber3 = Climber.new({ 'name' => 'Ross', 'skill_level' => 1})

climber1.save
climber2.save
climber3.save

route1 = Route.new({ 'name' => 'The Buachille', 'difficulty' => 5})

route1.save

outing1 = Outing.new({ 'climber_id' => climber1.id, 'route_id' => route1.id, 'review' => 'Too easy!'})

outing1.save

binding.pry
nil
