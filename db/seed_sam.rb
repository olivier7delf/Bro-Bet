def seed_prod
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
    email: "",
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
  user = User.new(
    nickname: "Léa",
    email: "lea@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676499/Le%CC%81a_bxeyi0.png')
  user.photo.attach(io: file, filename: 'leaprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Anais",
    email: "anais@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676497/Anais_vgq02z.png')
  user.photo.attach(io: file, filename: 'anaisprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Adrien",
    email: "adri@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676496/Adri_lrpdta.png')
  user.photo.attach(io: file, filename: 'adriprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Ludovic",
    email: "ludo@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676498/Ludo_nt9ab4.png')
  user.photo.attach(io: file, filename: 'ludoprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Samah",
    email: "samah@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676499/Samah_sto0ha.png')
  user.photo.attach(io: file, filename: 'samahprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Céline",
    email: "celine@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676496/Celine_ttggvj.png')
  user.photo.attach(io: file, filename: 'celineprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Florian",
    email: "flo@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676498/Florian_sud1ha.png')
  user.photo.attach(io: file, filename: 'floprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Kernan",
    email: "kernan@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676497/Kernan_z3x0qc.png')
  user.photo.attach(io: file, filename: 'kernanprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Pierre",
    email: "pierre@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676499/Pierre_wak7ta.png')
  user.photo.attach(io: file, filename: 'pierreprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Amélie",
    email: "amelie@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676496/Amelie_zyw5ql.png')
  user.photo.attach(io: file, filename: 'amelieprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Chloé",
    email: "chloe@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676498/Chloe_onbqry.png')
  user.photo.attach(io: file, filename: 'chloeprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Jérémy",
    email: "jeremy@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676498/Jerem_gispnb.png')
  user.photo.attach(io: file, filename: 'jeremyprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Déva",
    email: "deva@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676497/Deva_ria2uf.png')
  user.photo.attach(io: file, filename: 'devaprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Sophie",
    email: "so@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676500/Sophie_urfipb.png')
  user.photo.attach(io: file, filename: 'soprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Victorien",
    email: "vic@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676500/Victorien_pl9fu7.png')
  user.photo.attach(io: file, filename: 'vicprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Ophélie",
    email: "ophe@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676499/Ophe%CC%81_pginsw.png')
  user.photo.attach(io: file, filename: 'opheprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Bertrand",
    email: "ber@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676497/Bertrand_ls8dtp.png')
  user.photo.attach(io: file, filename: 'berprofile', content_type: 'image/png')
  user.save!
  user = User.new(
    nickname: "Manu",
    email: "manu@g.com",
    password: "123123",
  )
  file = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1598676498/Manu_iagi2g.png')
  user.photo.attach(io: file, filename: 'manuprofile', content_type: 'image/png')
  user.save!
end
