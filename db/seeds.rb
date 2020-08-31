# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
puts "DESTROYED : Message"

Chatroom.destroy_all
puts "DESTROYED : Chatroom"

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

User.create(nickname: "Margot", email: "margot@g.com", password: "123123")
User.create(nickname: "Samuel", email: "sam@g.com", password: "123123")
User.create(nickname: "Théotime", email: "tt@g.com", password: "123123")
User.create(nickname: "Olivier", email: "oli@g.com", password: "123123")
puts "CREATED : Users"



Bet.create!(
  title: "TT va t il récupérer son scoot avant jeudi soir ?",
  description: "",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 28, 19, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Théotime")
)
puts "CREATED : TT Bête"

Bet.create!(
  title: "Margot deviendra t elle une Gryffondor ?",
  description: "",
  stake: "100 teilles",
  closed_at: DateTime.new(2020, 8, 26, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 29, 19, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Théotime")
)
puts "CREATED : Margot Bête"


Bet.create!(
  title: "Sam va être malade dans le Space Mountain",
  description: "",
  stake: "1 cubi de rosé",
  closed_at: DateTime.new(2020, 8, 29, 20, 0, 0),
  resulted_at: DateTime.new(2020, 8, 30, 20, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Théotime")
)
puts "CREATED : Disney bet"

Bet.create!(
  title: "Le vin rosé est un mélange de vin blanc et de vin rouge de la même AOC?",
  description: "Savoir ce que l'on boit frais l'été",
  stake: "un verre de rosé",
  closed_at: DateTime.new(2020, 8, 25, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 25, 18, 0, 0),
  owner_choice: false,
  user: User.find_by(nickname: "Théotime")
)
puts "CREATED : Rosé bet"

Bet.create!(
  title: "La coprolithe, un collectionneur en possède plus de 1200. Est-ce vrai?",
  description: "Pour être sûr qu'il exite bien des 💩 pré-histériques...",
  stake: "💩",
  closed_at: DateTime.new(2020, 8, 20, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 20, 19, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Théotime")
)
puts "CREATED : copro bet"

start_titles = [
  'Maxime va choper',
  'Antoine mangera une brebis entière',
  "Nu, Didier fera l'hélico",
  "Le tigre de Bertrand mangera Kernan",
  "Le scooter de Florian se vendra pour une chocolatine"
]

end_titles = [
  "d'ici demain",
  'samedi soir',
  'au mariage de Sama',
  "en haut de la vieille tour",
  "au cinéma"
]

stakes = [
  "une pinte",
  "une claque",
  "une bouteille de rosé",
  "une bonne villageoise (vin)",
  "3kg de patates",
  "100 patates",
  "2kg de pur bolivienne",
  "le pull de mamie",
  "une girafe"
]

nicknames = User.all.map {|user| user.nickname }

5.times do
  closed_at = DateTime.now + 2 - Random.rand(1..10*24) / 24
  resulted_at = closed_at + Random.rand(1..10*24) / 24
  owner_choice = [true, false].sample()
  title = [start_titles.sample(), end_titles.sample()].join(', ')
  user = User.find_by(nickname: nicknames.sample())
  Bet.create!(
    title: title,
    description: title,
    stake: stakes.sample,
    closed_at: closed_at,
    resulted_at: resulted_at,
    owner_choice: [true, false].sample(),
    user: user
  )
  puts "CREATED : Bet par #{user.nickname} : #{title[0..20]}"
end



Bet.all.each do |bet|
  User.all.each do |user|
    if user == bet.user
      puts "== #{user}, #{bet}"
      BetParticipation.create!(user: user, bet: bet, user_choice: bet.owner_choice)
    elsif (1..100).to_a.sample() > 30
      user_choice = [true, false].sample()
      puts "#{user}, #{bet}, user_choice = #{user_choice}"
      BetParticipation.create!(user: user, bet: bet, user_choice: user_choice)
    end
    puts "CREATED : BetParticipation #{user.nickname} au pari de #{bet.user.nickname} : #{bet.title[0..20]}"
  end

  if (1..100).to_a.sample() > 10 && bet.resulted_at < DateTime.now
    bet.update(result: [true, false].sample())
    puts "UPDATED : Bet result"
  end
end

Tournament.create!(
  title: "Championat des sports inconnus de septembre",
  description: "Chacun doit trouver un sport peu connu ayant une compétition et parier dessus",
  stake: "une bouteille",
  max_bets_number: 10,
  closed_at: DateTime.new(2020, 9, 5, 12, 0, 0),
  resulted_at: DateTime.new(2020, 9, 30, 19, 0, 0),
  user: User.find_by(nickname: "Théotime")
)

TournamentBet.create!(
  tournament: Tournament.last,
  bet: Bet.last
)

TournamentParticipation.create!(
  tournament: Tournament.last,
  user: User.find_by(nickname: "Théotime")
)

# mon_dernier_bet_participation_plus_bet = BetParticipation.joins(:bet).where(user: User.last).last
# mes_bet_participationS_plus_bet = BetParticipation.joins(:bet).where(user: User.last)

# def verify_same_result_and_increment_compteur(bp_b, compteur)
#   if bp_b.bet.result == bp_b.user_choice
#     compteur += 1
#   end
#   return compteur
# end

# ###

# compteur = 0
# bp_bs = BetParticipation.joins(:bet).where(user: User.last)
# # Joiture automatique de BetParticipation (model) et bet (la table est au singulier car belongs_to :bet dans le modèle)
# # where le user est celui choisit (ici le dernier)
# bp_b = bp_bs.last
# if bp_b.bet.result == bp_b.user_choice
#   compteur += 1
# end

# ###

# compteur = 0

# bp_bs = BetParticipation.joins(:bet).where(user: User.last)
# # bp_bs est une liste qu'il faut parcourir
# bp_bs.each do |bp_b|
#   if bp_b.bet.result == bp_b.user_choice
#     compteur += 1
#   end
# end
