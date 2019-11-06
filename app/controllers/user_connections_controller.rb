class UserConnectionsController < ApplicationController
  def create
    user_connection = UserConnection.new(
      connector: User.find(params[:connector]),
      connectee: User.find(params[:connectee])
    )

    if user_connection.save
      redirect_to user_connection_messages_path(user_connection)
    end
  end
end
