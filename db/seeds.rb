# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

# hubs
filepath = File.join(__dir__, 'data/hubs.csv')
CSV.foreach(filepath, csv_options) do |row|
puts 'creating hubs'
p row['city']
  hub = Hub.new(
    name: row['name'],
    city: row['city'],
    country: row['country'],
    description: row['description']
  )

  hub.photo = row['photo']
  hub.cover_photo = row['cover_photo']
  hub.save!
end

# users
filepath_users = File.join(__dir__, 'data/users.csv')
CSV.foreach(filepath_users, csv_options) do |row|
puts 'creating users'
  user = User.new(
    email: row['email'],
    password: row['encrypted_password'],
    first_name: row['first_name'],
    last_name: row['last_name'],
    birthdate: row['birthdate'],
    nationality: row['nationality'],
    description: row['description'],
    hub_id: row['hub_id'],
    is_teacher: row['is_teacher'].to_i
  )

  user.profile_photo = row['profile_photo']
  user.cover_photo = row['cover_photo']

  user.save!
end

puts 'creating Quinn'
user = User.new(
  email: "quinnzite@gmail.com",
  password: "password",
  first_name: "Quinn",
  last_name: "Zite",
  birthdate: "1988-06-26"
  nationality: "American",
  description: "Quinn is awesome",
  hub_id: 2,
  is_teacher: false
)

user.save!
puts 'Quinn now exists'

puts 'creating Mason'
user = User.new(
  email: "msnyder193@gmail.com",
  password: "password",
  first_name: "Mason",
  last_name: "Snyder",
  birthdate: "1997-03-08",
  nationality: "American",
  description: "Mason is awesome",
  hub_id: 2,
  is_teacher: false
)

user.save!
puts 'Mason now exists'

# studios
filepath_studios = File.join(__dir__, 'data/studios.csv')
CSV.foreach(filepath_studios, csv_options) do |row|
puts 'creating studio'
  studio = Studio.new(
    name: row['name'],
    address: row['address'],
    hub_id: row['hub_id'],
    website: row['website'],
    email: row['email'],
    phone_number: row['phone_number'],
    hours: row['hours'],
    styles: row['styles']
  )

  studio.photo = row['photo']
  studio.save!
end

# events
filepath_events = File.join(__dir__, 'data/events.csv')
CSV.foreach(filepath_events, csv_options) do |row|
puts 'creating event'
  event = Event.new(
    user_id: row['user_id'],
    hub_id: row['hub_id'],
    title: row['title'],
    description: row['description'],
    start_time: DateTime.parse(row['start_time']),
    end_time: DateTime.parse(row['end_time']),
    location_name: row['location_name'],
    address: row['address'],
    capacity: row['capacity'],
    price: row['price']
  )

  event.photo = row['photo']
  event.save!
end

# languages
filepath_languages = File.join(__dir__, 'data/languages.csv')
CSV.foreach(filepath_languages, csv_options) do |row|
puts 'creating languages'
  language = Language.new(
    name: row['name']
  )
  language.save!
end

# certifications
filepath_certifications = File.join(__dir__, 'data/certifications.csv')
CSV.foreach(filepath_certifications, csv_options) do |row|
puts 'creating certifications'
  certification = Certification.new(
    name: row['name']
  )
  certification.save!
end

# teaching_styles
filepath_teaching_styles = File.join(__dir__, 'data/teaching_styles.csv')
CSV.foreach(filepath_teaching_styles, csv_options) do |row|
puts 'creating teaching_styles'
  teaching_type = TeachingStyle.new(
    name: row['name']
  )
  teaching_type.save!
end

# teacher_languages
filepath_teacher_languages = File.join(__dir__, 'data/teacher_languages.csv')
CSV.foreach(filepath_teacher_languages, csv_options) do |row|
puts 'creating teacher_languages'
  teacher_language = TeacherLanguage.new(
    user_id: row['user_id'],
    language_id: row['language_id']
  )
  teacher_language.save!
end

# teacher_certifications
filepath_teacher_certifications = File.join(__dir__, 'data/teacher_certifications.csv')
CSV.foreach(filepath_teacher_certifications, csv_options) do |row|
puts 'creating teacher_certifications'
  teacher_certification = TeacherCertification.new(
    user_id: row['user_id'],
    certification_id: row['certification_id']
  )
  teacher_certification.save!
end

# teacher_teaching_styles
filepath_teacher_teaching_styles = File.join(__dir__, 'data/teacher_teaching_styles.csv')
CSV.foreach(filepath_teacher_teaching_styles, csv_options) do |row|
puts 'creating teacher_teaching_styles'
  teacher_teaching_style = TeacherTeachingStyle.new(
    user_id: row['user_id'],
    teaching_style_id: row['teaching_style_id']
  )
  teacher_teaching_style.save!
end

# types
filepath_types = File.join(__dir__, 'data/types.csv')
CSV.foreach(filepath_types, csv_options) do |row|
puts 'creating types'
  type = Type.new(
    name: row['name']
  )
  type.save!
end

# event_types
filepath_event_types = File.join(__dir__, 'data/event_types.csv')
CSV.foreach(filepath_event_types, csv_options) do |row|
puts 'creating event_types'
  event_type = EventType.new(
    event_id: row['event_id'],
    type_id: row['type_id']
  )
  event_type.save!
end

# event_bookings
filepath_event_bookings = File.join(__dir__, 'data/event_bookings.csv')
CSV.foreach(filepath_event_bookings, csv_options) do |row|
puts 'creating event_bookings'
  event_booking = EventBooking.new(
    event_id: row['event_id'],
    user_id: row['user_id']
  )
  event_booking.save!
end

# teacher_experiences
filepath_teacher_experiences = File.join(__dir__, 'data/teacher_experiences.csv')
CSV.foreach(filepath_teacher_experiences, csv_options) do |row|
puts 'creating teacher_experiences'
  teacher_experience = TeacherExperience.new(
    user_id: row['user_id'],
    studio_name: row['studio_name'],
    description: row['description'],
    start_date: row['start_date'],
    end_date: row['end_date'],
    location: row['location']
  )
  teacher_experience.save!
end


# user_connections
filepath_user_connections = File.join(__dir__, 'data/user_connections.csv')
CSV.foreach(filepath_user_connections, csv_options) do |row|
puts 'creating user_connections'
  user_connection = UserConnection.new(
    connectee_id: row['connectee_id'],
    connector_id: row['connector_id']
  )
  user_connection.save!
end

# messages
filepath_messages = File.join(__dir__, 'data/messages.csv')
CSV.foreach(filepath_messages, csv_options) do |row|
puts 'creating messages'
  message = Message.new(
    user_connection_id: row['user_connection_id'],
    user_id: row['user_id'],
    content: row['content']
  )
  message.save!
end


# # tags
# filepath_tags = File.join(__dir__, 'data/tags.csv')
# CSV.foreach(filepath_tags, csv_options) do |row|
# puts 'creating tags'
#   tag = Tag.new(
#     tag_name: row['tag_name'],
#     tag_type: row['tag_type']
#   )
#   tag.save!
# end





