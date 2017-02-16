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
route2 = Route.new({ 'name' => 'Ben Aan', 'difficulty' => 3})
route3 = Route.new({ 'name' => 'Salisbury Crags', 'difficulty' => 1})

route1.save
route2.save
route3.save

outing1 = Outing.new({ 'climber_id' => climber1.id, 'route_id' => route1.id, 'review' => 'Too easy!'})
outing2 = Outing.new({ 'climber_id' => climber2.id, 'route_id' => route2.id, 'review' => 'Big drop!'})
outing3 = Outing.new({ 'climber_id' => climber2.id, 'route_id' => route1.id, 'review' => 'Too hard!'})
outing4 = Outing.new({ 'climber_id' => climber3.id, 'route_id' => route3.id, 'review' => 'I did it!!!!!'})

outing1.save
outing2.save
outing3.save
outing4.save

binding.pry
nil
