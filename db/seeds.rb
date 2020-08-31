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

# User.destroy_all
# puts "DESTROYED : User"

User.create(nickname: "Margot", email: "margot@g.com", password: "123123")
User.create(nickname: "Samuel", email: "sam@g.com", password: "123123")
User.create(nickname: "Théotime", email: "tt@g.com", password: "123123")
User.create(nickname: "Olivier", email: "oli@g.com", password: "123123")
puts "CREATED : Users"

Bet.create!(
  title: "Paris en cours (de Moi)",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2021, 8, 28, 19, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Théotime")
)
puts "CREATED : TT Bête"

Bet.create!(
  title: "Résultat à mettre (de Moi)",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 28, 22, 51, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Théotime")
)
puts "CREATED : TT Bête"

Bet.create!(
  title: "Pari terminé (de Moi)",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 28, 22, 54, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Théotime"),
  result: true
)
puts "CREATED : TT Bête"

Bet.create!(
  title: "Pari en cours (de Sam)",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2021, 8, 28, 22, 54, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Samuel"),
)
puts "CREATED : Sam Bête"

Bet.create!(
  title: "Pari terminé (de Sam)",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 28, 22, 54, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Samuel"),
  result: true
)
puts "CREATED : Sam Bête"

Bet.all.each do |bet|
  User.all.each do |user|
    if user == bet.user
      BetParticipation.create!(user: user, bet: bet, user_choice: bet.owner_choice)
    else
      BetParticipation.create!(user: user, bet: bet, user_choice: !bet.owner_choice)
    end
  end
end

Bet.create!(
  title: "Pari à rejoindre (de Sam)",
  stake: "une pinte",
  closed_at: DateTime.now + 5,
  resulted_at: DateTime.new(2021, 8, 28, 22, 54, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Samuel"),
)
puts "CREATED : Sam Bête"

BetParticipation.create!(user: User.find_by(nickname: "Samuel"), bet: Bet.last, user_choice: Bet.last.owner_choice)

# Bet.all.each do |bet|
#   User.all.each do |user|
#     if user == bet.user
#       puts "== #{user}, #{bet}"
#       BetParticipation.create!(user: user, bet: bet, user_choice: bet.owner_choice)
#     elsif (1..100).to_a.sample() > 30
#       user_choice = [true, false].sample()
#       puts "#{user}, #{bet}, user_choice = #{user_choice}"
#       BetParticipation.create!(user: user, bet: bet, user_choice: user_choice)
#     end
#     puts "CREATED : BetParticipation #{user.nickname} au pari de #{bet.user.nickname} : #{bet.title[0..20]}"
#   end

#   if (1..100).to_a.sample() > 10 && bet.resulted_at < DateTime.now
#     bet.update(result: [true, false].sample())
#     puts "UPDATED : Bet result"
#   end
# end



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
