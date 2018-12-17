class ProfilesController < ApplicationController
before_action :authenticate_user!
  def new
  	@profile = Profile.new
  end

  def create
  	@profile = current_user.build_profile(profile_params)
  	if @profile.save
  		redirect_to root_path
  end

  def show
  	@profile = Profile.find_by(id: params[:id])
  end

  def edit
  	@profile = Profile.find_by(id: params[:id])
  end

  def update
  	@profile = Profile.find_by(id: params[:id])
    if @profile.update(profile_params)
  		redirect_to profile_path(@profile.id)
  	else
  		render 'edit'
  	end
  end

  def destroy
    @profile = Profile.find_by(id: params[:id])
  	@profile.destroy 
  	redirect_to root_path
  end

private 
  def profile_params
  	params.require(:profile).permit(:user_id, :firstname, :lastname, :age, :avatar)
  end
end
