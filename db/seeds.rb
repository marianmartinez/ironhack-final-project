t= Track.create name: "Web development"
t2= Track.create name: "UX"
t3= Track.create name: "Web Design"
t4= Track.create name: "Marketing"

10.times do
  User.create(name: FFaker::Name.name, email: FFaker::Internet.email, password: 123)
end

u = User.create(name: 'Marian Martínez', email: 'marian.mtnz@gmail.com', password: 123)
u = User.create(name: 'Pepe López', email: 'pepe@pepe.com', password: 123)
