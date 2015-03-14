class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_profile, only: [:show, :edit, :update]

  def show
    @profile = current_user.profile
    @profile.set_attributes! if @profile.present?
  end

  def edit
    @profile = current_user.profile

    if @profile.blank?
      @profile = current_user.build_profile
      @profile.save
    else
      @profile.set_attributes!
    end
  end

  def update
    @profile = current_user.profile
    @profile.update_user!(profile_params)

    if @profile.update_attributes(profile_params)
      @notice = 'Profile updated successfully'
    end

    render action: :edit, notice: @notice
  end

  private

  def load_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :username, :phone_no, :dob, :place, :country)
  end

end
