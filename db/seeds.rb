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
  closed_at: DateTime.new(2020, 8, 26, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 29, 19, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "tt")
)
puts "CREATED : Margot Bête"


Bet.create!(
  title: "Sam va être malade dans le Space Mountain",
  description: "",
  stake: "1 cubi de rosé",
  closed_at: DateTime.new(2020, 8, 29, 20, 0, 0),
  resulted_at: DateTime.new(2020, 8, 30, 20, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "tt")
)
puts "CREATED : Disney bet"

Bet.create!(
  title: "Le vin rosé est un mélange de vin blanc et de vin rouge de la même AOC?",
  description: "Savoir ce que l'on boit frais l'été",
  stake: "un verre de rosé",
  closed_at: DateTime.new(2020, 8, 25, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 25, 18, 0, 0),
  owner_choice: false,
  user: User.find_by(nickname: "tt")
)
puts "CREATED : Rosé bet"
Bet.create!(
  title: "La coprolithe, un collectionneur en possède plus de 1200. Est-ce vrai?",
  description: "Pour être sûr qu'il exite bien des 💩 pré-histériques...",
  stake: "💩",
  closed_at: DateTime.new(2020, 8, 20, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 20, 19, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "tt")
)
puts "CREATED : La copro"

# BetParticipation.create!(user: User.find_by(nickname: "margot"), bet: Bet.last, user_choice: true)
# puts "CREATED : BetParticipation Margot au pari de TT"
# BetParticipation.create!(user: User.find_by(nickname: "tt"), bet: Bet.last, user_choice: false)
# puts "CREATED : BetParticipation TT au pari de TT"


Bet.all.each do |bet|
  User.all.each do |user|
    if user == bet.user
      puts "== #{user}, #{bet}"
      BetParticipation.create!(user: user, bet: bet, user_choice: bet.owner_choice)
    else
      user_choice = [true, false].sample()
      puts "#{user}, #{bet}, user_choice = #{user_choice}"
      BetParticipation.create!(user: user, bet: bet, user_choice: user_choice)
    end
    puts "CREATED : BetParticipation #{user.nickname} au pari de #{bet.user.nickname} : #{bet.title[0..20]}"
  end

  if [true, false].sample()
    bet.update(result: [true, false].sample())
    puts "UPDATED : Bet result"
  end
end

