# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


BetParticipation.destroy_all
puts "DESTROYED : Bet_participation"
TournamentParticipation.destroy_all
puts "DESTROYED : Tournament_participation"
TournamentBet.destroy_all
puts "DESTROYED : Tournament_bet"

Bet.destroy_all
puts "DESTROYED : Bet"
Tournament.destroy_all
puts "DESTROYED : Tournament"

User.create(nickname: "margot", email: "m@g.com", password: "123123")
User.create(nickname: "sam", email: "s@g.com", password: "123123")
User.create(nickname: "tt", email: "t@g.com", password: "123123")
User.create(nickname: "o", email: "o@g.com", password: "123123")
puts "CREATED : Users"

Bet.create!(
  title: "TT va t il récupérer son scoot avant jeudi soir ?",
  description: "",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 28, 19, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "tt")
)
puts "CREATED : TT Bête"

Bet.create!(
  title: "Margot deviendra t elle une Gryffondor ?",
  description: "",
  stake: "100 teilles",
  closed_at: DateTime.new(2020, 8, 2, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 29, 19, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "tt")
)
puts "CREATED : Margot Bête"

