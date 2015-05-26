def create_tracks(user, total)
  total.times do |n|
    t = user.tracks.create! name: "Web development-#{n}"
    3.times do |m|
      s= t.goals.create!( name: "HTML-#{m}", description: "Lorem ipsum", goal_date: Date.today)
      s.sources.create!(
         name: "A Beckett Canon",
         image: "http://bks7.books.google.es/books/content?id=jaPPggPbMSQC&printsec=frontcover&img=1&zoom=2&edge=none&source=gbs_api",
         url: "http://books.google.es/books?id=jaPPggPbMSQC&printsec=frontcover&dq=ruby&hl=&cd=1&source=gbs_api",
         kind: "book")
    end
  end
end

u = User.create!(name: 'Marian Martínez', email: 'marian.mtnz@gmail.com', password: 123)
create_tracks(u, 4) if !u.new_record?

u2 = User.create!(name: 'Pepe López', email: 'pepe@pepe.com', password: 123)
create_tracks(u2, 3) if !u2.new_record?

10.times do
  User.create!(name: FFaker::Name.name, email: FFaker::Internet.email, password: 123)
end
