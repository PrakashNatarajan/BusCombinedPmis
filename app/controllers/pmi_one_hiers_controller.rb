class PmiOneHiersController < BasePmisController
  before_action :fetch_role_user_prod, only: %i[ measures my_teams sub_teams colleagues leadranks ]

  # GET /measures?pri_user=Role__User__Prod
  def measures
    pmi_qgp_hiers = PmiOneHierLevel.current_measures(group_channel: params[:group_channel], role_user_prod: params[:role_user_prod])

    render json: pmi_qgp_hiers
  end

  # GET /myteams?pri_user=Role__User__Prod
  def my_teams
    current_measures = PmiOneHierLevel.current_measures(group_channel: params[:group_channel], role_user_prod: params[:role_user_prod])
    myteams_measures = PmiOneHierLevel.my_teams_measures(group_channel: params[:group_channel], role_user_prod: params[:role_user_prod])

    render json: (current_measures + myteams_measures)
  end

  # GET /subteams?pri_user=Role__User__Prod
  def sub_teams
    lead = BusinessHierarchy.fetch_lead_role(role_level: params[:role])
    current_measures = PmiOneHierLevel.current_measures(group_channel: params[:group_channel], role_user_prod: params[:role_user_prod])
    mylead_measures = PmiOneHierLevel.my_lead_measures(group_channel: params[:group_channel], role_user_prod: params[:role_user_prod], lead: lead)
    myteams_measures = PmiOneHierLevel.sub_teams_measures(group_channel: params[:group_channel], role_user_prod: params[:role_user_prod])

    render json: {current_measures: current_measures, mylead_measures: mylead_measures, myteams_measures: myteams_measures}
  end

  # GET /colleagues?pri_user=Role__User__Prod
  def colleagues
    lead = BusinessHierarchy.fetch_lead_role(role_level: params[:role])
    colleagues_measures = PmiOneHierLevel.my_colleagues_measures(group_channel: params[:group_channel], role_user_prod: params[:role_user_prod], lead: lead)

    render json: colleagues_measures
  end

  # GET /leadranks?pri_user=Role__User__Prod
  def leadranks
    lead = BusinessHierarchy.fetch_lead_role(role_level: params[:role])
    colleagues_measures = PmiOneHierLevel.my_colleagues_measures(group_channel: params[:group_channel], role_user_prod: params[:role_user_prod], lead: lead)

    render json: colleagues_measures
  end

  
  private
  # Use climit(10)backs to share common setup or constraints between actions.
  def fetch_role_user_prod
    params[:group_channel] = request.headers.fetch("GROUP-CHANNEL", "NoChannel")
    params[:role_user_prod] = "#{params[:role]}##{params[:user]}##{params[:prod]}"
  end

end
