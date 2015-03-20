class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessor :name, :username

  def update_user!(user_params)
    params =  user_params.extract!(:name, :username)
    user.name = params[:name]
    user.username = params[:username]
    user.save
  end

  def set_attributes!
    self.name     = user.name
    self.username = user.username
  end
end
