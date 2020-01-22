# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# int_arr_id = []

10.times do
  User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      username: Faker::Name.unique.name,
      password: '123'
  )
end

IMG_URL = [
    'https://11m5ki43y82budjol1gjvv5s-wpengine.netdna-ssl.com/wp-content/uploads/2019/04/whats-new-in-angular-min.jpg',
    'data:image/png;base64,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',
    'https://community-cdn-digitalocean-com.global.ssl.fastly.net/assets/tutorials/images/large/ruby-on-rails.jpg?1565909621',
    'https://hackster.imgix.net/uploads/attachments/940359/aws_iot_-hackster2x_cuKmfeEoRk.png?auto=compress%2Cformat&w=900&h=675&fit=min',
    'https://cdn.evilmartians.com/front/posts/optimizing-react-virtual-dom-explained/cover-a1d5b40.png',
    'https://cdn.auth0.com/blog/emberjs/logo.png',
    'https://i.udemycdn.com/course/750x422/1562632_a245_2.jpg',
    'https://www.oracle.com/a/ocom/img/hp11-intl-java-logo.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrMgycUeVQLG4A8Gedag_6iQenoajqqhy8aM19wpJ5z9I9NpQAjQ&s',
    'https://storage.googleapis.com/blog-images-backup/1*2gKr79YTmj2MkP8zLOn-bg.png'
].freeze

DIFFICULTIES = %w(beginner intermediate advanced).freeze

10.times do
  Quiz.create(
      title: Faker::DcComics.title,
      img: IMG_URL[rand(0..9)],
      duration: rand(1..30),
      difficulty: DIFFICULTIES[rand(0..2)],
      num_of_questions: rand(1..35),
      quizzed: rand(1..5000),
      collaborative: true,
      personal: false,
      user: User.all.sample
  )
end