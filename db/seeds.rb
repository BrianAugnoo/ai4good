puts("cleaning")
Examiner.destroy_all
Group.destroy_all
Member.destroy_all
puts("create examiner")
3.times do |i|
  Examiner.create!(email: "admin#{i+1}@admin.com", name: Faker::Name.name, password: ENV["PASSWORD"])
end

puts("crate groups")
5.times do |i|
  Group.create!(name: "group#{i+1}", etablished: Faker::University.name, theme: Faker::Book.genre)
end

puts("create members")
5.times do |i|
  group_id = Group.where(name: "group#{i+1}")[0].id
  puts(group_id)
  5.times do
    Member.create!(group_id: group_id, name: Faker::Name.name)
  end
end

puts("lets go gang😎")
