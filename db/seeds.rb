# puts("cleaning")
# Examiner.destroy_all
# AgeSection.destroy_all
# Group.destroy_all
Member.destroy_all
# puts("create examiner")
# 3.times do |i|
#   Examiner.create!(email: "examiner#{i+1}@examiner.com", name: Faker::Name.name, password: ENV["PASSWORD"])
# end

# puts("create age section")
# AgeSection.create_for_seed

# puts("create groups")
# AgeSection.all.each do |age_section|
#   5.times do |i|
#     Group.create!(name: "group#{i+1}", etablished: Faker::University.name, theme: Faker::Book.genre, age_section_id: age_section.id)
#   end
# end

puts("create members")
Group.all.each do |group|
  5.times do
    Member.create!(group_id: group.id, name: Faker::Name.name)
  end
end

puts("lets go gang😎")
