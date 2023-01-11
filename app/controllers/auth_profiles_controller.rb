class AuthProfilesController < ApplicationController
  before_action :set_auth_profile, only: %i[ show update destroy ]

  # GET /authprofiles
  def index
    @auth_profiles = BusAuthProfile.all

    render json: @auth_profiles
  end

  # GET /authprofiles/1
  def show
    render json: @auth_profile
  end

  # POST /authprofiles
  def create
    @auth_profile = BusAuthProfile.new(auth_profile_params)

    if @auth_profile.save
      render json: @auth_profile, status: :created, location: @auth_profile
    else
      render json: @auth_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authprofiles/1
  def update
    if @auth_profile.update(auth_profile_params)
      render json: @auth_profile
    else
      render json: @auth_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authprofiles/1
  def destroy
    @auth_profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_profile
      @auth_profile = BusAuthProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auth_profile_params
      params.require(:auth_profile).permit(:group_channel, :role_level, :role_user, :role_prod, :access_token, :expired_at, :created_at, :updated_at)
    end
end
