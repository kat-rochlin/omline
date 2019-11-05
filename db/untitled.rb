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
