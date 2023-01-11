class GenPmiTracksController < ApplicationController
  before_action :set_pmi_tracking, only: %i[ update destroy ]

  # GET /pmitrackings
  def index
    @pmi_trackings = GenericPmiTracking.all

    render json: @pmi_trackings
  end

  # GET /pmitrackings/1
  def show
    @pmi_tracking = GenericPmiTracking.find(params[:guid])
    render json: @pmi_tracking
  end

  # POST /pmitrackings
  def create
    @pmi_tracking = GenericPmiTracking.new(pmi_tracking_params)

    if @pmi_tracking.save
      render json: @pmi_tracking, status: :created, location: @pmi_tracking
    else
      render json: @pmi_tracking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pmitrackings/1
  def update
    if @pmi_tracking.update(pmi_tracking_params)
      render json: @pmi_tracking
    else
      render json: @pmi_tracking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pmitrackings/1
  def destroy
    @pmi_tracking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pmi_tracking
      @pmi_tracking = GenericPmiTracking.find(params[:guid])
    end

    # Only allow a list of trusted parameters through.
    def pmi_tracking_params
      params.require(:pmi_tracking).permit(:guid, :owner_role, :owner_user, :owner_prod, :role_level, :role_user, :role_prod, :pmi_short_name, :track_status, :source_type, :start_value, :start_date, :target_value, :target_date)
    end
end
