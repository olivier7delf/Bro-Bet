require_relative "./seed_sam"

Bonuse.destroy_all
puts "DESTROYED : Bonuse"

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

User.destroy_all
puts "DESTROYED : User"



bonuse = Bonuse.new(
    title: "étoile",
    probability: 0.05,
    description: "Invicible, aucun bonus adverse ne t'atteint",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1599154732/%C3%A9toile_r5nnak.png')
  bonuse.photo.attach(io: file, filename: 'etoile', content_type: 'image/png')
  bonuse.save!

bonuse = Bonuse.new(
    title: "éclair",
    probability: 0.02,
    description: "https://res.cloudinary.com/dv1x9ot6j/image/upload/c_scale,w_393/v1599154730/%C3%A9clair_f4fzec.png",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676499/Margot_ir7hyr.png')
  bonuse.photo.attach(io: file, filename: 'eclair', content_type: 'image/png')
  bonuse.save!

bonuse = Bonuse.new(
    title: "champignon",
    probability: 0.1,
    description: "Vroum ! Vous passez la seconde et vos gains sont multipliés par deux !",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1599154730/Champignon_gjxtuq.png')
  bonuse.photo.attach(io: file, filename: 'margotprofile', content_type: 'image/png')
  bonuse.save!

bonuse = Bonuse.new(
    title: "dynamite",
    probability: 0.07,
    description: "Tic tac ! Attention à ne pas vous bruler, elle risque de vous exploser dessus, mais si cela n'arrive pas, votre cible se fera un plaisir de la récupérer...",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/c_scale,w_384/v1599154731/dynamite_nehjrg.png')
  bonuse.photo.attach(io: file, filename: 'dynamite', content_type: 'image/png')
  bonuse.save!

bonuse = Bonuse.new(
    title: "switch",
    probability: 0.05,
    description: "Hop ! Vous filoutez en échangeant votre choix de pari avec un adversaire",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1599154730/switch_jbz31y.png')
  bonuse.photo.attach(io: file, filename: 'switch', content_type: 'image/png')
  bonuse.save!

bonuse = Bonuse.new(
    title: "brollard",
    probability: 0.95,
    description: "Cool un brollard ! 1 chance sur 10 d'avoir vos gains multipliés par deux !",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1599154730/brollard_wb3aj6.png')
  bonuse.photo.attach(io: file, filename: 'brollard', content_type: 'image/png')
  bonuse.save!

bonuse = Bonuse.new(
    title: "tortue rouge",
    probability: 0.05,
    description: "Le tord tue !",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1599155874/MK8-CaraoaceRouge-Illustration_viehqd.png')
  bonuse.photo.attach(io: file, filename: 'tortuerouge', content_type: 'image/png')
  bonuse.save!

bonuse = Bonuse.new(
    title: "tortue bleue",
    probability: 0.95,
    description: "As-tu tort ?",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1599155873/tortue_bleue_ut6nip.png')
  bonuse.photo.attach(io: file, filename: 'tortuebleue', content_type: 'image/png')
  bonuse.save!
puts "CREATED : Bonuses"

puts "Creating Users..."
  user = User.new(
    nickname: "Margot",
    email: "m@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676499/Margot_ir7hyr.png')
  user.photo.attach(io: file, filename: 'margotprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Sam",
    email: "sam@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676500/Sam_tzb5g4.png')
  user.photo.attach(io: file, filename: 'samprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Olivier",
    email: "o@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676498/Ol_ru1oda.png')
  user.photo.attach(io: file, filename: 'olivierprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Jonathan",
    email: "jonathan.serafini@gmail.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676498/Jo_jefczh.png')
  user.photo.attach(io: file, filename: 'joprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Théotime",
    email: "tt@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676500/TT_lsquso.png')
  user.photo.attach(io: file, filename: 'theoprofile', content_type: 'image/png')
  user.save!

Bet.create!(
  title: "1 Paris en cours (de Moi)",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2021, 8, 28, 19, 0, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Théotime")
)
puts "CREATED : TT Bête"

Bet.create!(
  title: "2 Résultat à mettre (de Moi)",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 28, 22, 51, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Théotime")
)
puts "CREATED : TT Bête"

Bet.create!(
  title: "3 Pari terminé (de Moi)",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 28, 22, 54, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Théotime"),
  result: true
)
puts "CREATED : TT Bête"

Bet.create!(
  title: "4 Pari en cours (de Sam)",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2021, 8, 28, 22, 54, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Sam"),
)
puts "CREATED : Sam Bête"

Bet.create!(
  title: "5 Pari terminé (de Sam)",
  stake: "une pinte",
  closed_at: DateTime.new(2020, 8, 27, 12, 0, 0),
  resulted_at: DateTime.new(2020, 8, 28, 22, 54, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Sam"),
  result: true
)
puts "CREATED : Sam Bête"

Bet.create!(
  title: "6 Pari à rejoindre (de Sam)",
  stake: "une pinte",
  closed_at: DateTime.now + 5,
  resulted_at: DateTime.new(2021, 8, 28, 22, 54, 0),
  owner_choice: true,
  user: User.find_by(nickname: "Sam"),
)
puts "CREATED : Sam Bête"

Bet.all.each do |bet|
  Chatroom.create(name: "bet-#{bet.id}", bet: bet)
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

tournament = Tournament.create!(
  title: "Championat des sports inconnus de septembre",
  description: "Chacun doit trouver un sport peu connu ayant une compétition et parier dessus",
  stake: "une bouteille",
  max_bets_number: 10,
  closed_at: DateTime.new(2020, 9, 5, 12, 0, 0),
  resulted_at: DateTime.new(2020, 9, 30, 19, 0, 0),
  user: User.find_by(nickname: "Théotime"),
  bonuse: true
)
Chatroom.create(name: "tournament-#{tournament.id}", tournament: tournament)

TournamentBet.create!(
  tournament: Tournament.last,
  bet: Bet.last
)

User.all.each do |user|
  TournamentParticipation.create!(
  tournament: Tournament.last,
  user: user
)
end
# TournamentParticipation.create!(
#   tournament: Tournament.last,
#   user: User.find_by(nickname: "Théotime")
# )

Tournament.create!(
  title: "Tournoi des vacances à Amiens",
  description: "Pour pimenter ce sejour dans cette ville de rêve",
  stake: "1 bougie à la vanille",
  max_bets_number: 10,
  closed_at: DateTime.new(2020, 9, 5, 12, 0, 0),
  resulted_at: DateTime.new(2020, 9, 30, 19, 0, 0),
  user: User.find_by(nickname: "Théotime")
)

Chatroom.create(name: "tournament-#{Tournament.last.id}", tournament: Tournament.last)

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


# seed_prod()
