require './brave'
require './monster'
require './games_controller'

games_controller = GamesController.new

terry = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
slime = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

games_controller.battle(brave: terry, monster: slime)

EXP_CONSTANT = 2
GOLD_CONSTANT = 3