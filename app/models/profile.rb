class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessor :name, :username, :avatar

  def update_user!(user_params)
    params =  user_params.extract!(:name, :username, :avatar)
    user.name = params[:name]
    user.username = params[:username]
    user.avatar   = params[:avatar]
    user.save
  end

  def set_attributes!
    self.name     = user.name
    self.username = user.username
    self.avatar   = user.avatar
  end
end
