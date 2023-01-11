module BaseDayPmiHierQuery

  def fetch_my_team_hiers(group_channel:, role_user_prod:, pmi_short_name:)
    select_statement = "business_role_hierarchies.role_level, business_role_hierarchies.role_user, business_role_hierarchies.role_prod, #{self.table_name}.*, filtered_pmi_trackings.guid as track_guid"
    hierarchy_join = "RIGHT JOIN business_role_hierarchies ON #{self.table_name}.role_user_prod = business_role_hierarchies.role_user_prod"
    pmi_track_join = "LEFT JOIN (#{pmi_tracking_sub_query(pmi_short_name: pmi_short_name)}) AS filtered_pmi_trackings ON filtered_pmi_trackings.role_user_prod = business_role_hierarchies.role_user_prod"
    select(select_statement).joins(hierarchy_join).joins(pmi_track_join).where(business_role_hierarchies: {group_channel: group_channel, role_lead_prod: role_user_prod})
  end

  def fetch_sub_team_hiers(group_channel:, role_user_prod:)
    select_statement = "business_role_hierarchies.role_level, business_role_hierarchies.role_user, business_role_hierarchies.role_prod, #{self.table_name}.*"
    hierarchy_join = "RIGHT JOIN business_role_hierarchies ON #{self.table_name}.role_user_prod = business_role_hierarchies.role_user_prod"
    select(select_statement).joins(hierarchy_join).where(business_role_hierarchies: {group_channel: group_channel, role_lead_prod: role_user_prod})
  end

  def fetch_my_lead_hiers(group_channel:, role_user_prod:, lead_level:)
    select_statement = "business_role_hierarchies.lead_level AS role_level, business_role_hierarchies.lead_user AS role_user, business_role_hierarchies.lead_prod AS role_prod, #{self.table_name}.*"
    hierarchy_join = "RIGHT JOIN business_role_hierarchies ON #{self.table_name}.role_user_prod = business_role_hierarchies.role_lead_prod"
    select(select_statement).joins(hierarchy_join).where(business_role_hierarchies: {group_channel: group_channel, lead_level: lead_level, role_user_prod: role_user_prod})
  end

  def fetch_colleague_hiers(group_channel:, role_user_prod:, lead_level:)
    select_statement = "colleagues_leaders.role_level, colleagues_leaders.role_user, colleagues_leaders.role_prod, #{self.table_name}.*"
    hierarchy_join = "RIGHT JOIN (#{colleagues_sub_query(role_user_prod: role_user_prod, lead_level: lead_level)}) AS colleagues_leaders ON #{self.table_name}.role_user_prod = colleagues_leaders.role_user_prod"
    select(select_statement).joins(hierarchy_join)
  end

  private

  def pmi_tracking_sub_query(pmi_short_name:)
    "SELECT generic_pmi_trackings.* FROM generic_pmi_trackings WHERE pmi_short_name = '#{pmi_short_name}' AND track_status = 'Started'"
  end

  def colleagues_sub_query(role_user_prod:, lead_level:)
    req_role = role_user_prod.split("#")[0]
    "SELECT co_users_hiers.* FROM business_role_hierarchies AS co_users_hiers, business_role_hierarchies AS lead_users_hiers WHERE co_users_hiers.role_level = '#{req_role}' AND lead_users_hiers.role_user_prod = '#{role_user_prod}' AND lead_users_hiers.lead_level = '#{lead_level}' AND co_users_hiers.role_lead_prod = lead_users_hiers.role_lead_prod"
  end

end
