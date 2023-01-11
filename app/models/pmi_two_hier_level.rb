class PmiTwoHierLevel < ApplicationRecord
  extend BaseDayPmiHierQuery

  has_many :business_hierarchies, join_table: 'business_role_hierarchies', foreign_key: 'role_user_prod'
  scope :user_measures, ->(role_user_prod) { where(role_user_prod: role_user_prod) }

  def self.current_measures(group_channel:, role_user_prod:)
    select("*").user_measures(role_user_prod)
  end

  def self.my_teams_measures(group_channel:, role_user_prod:)
    fetch_my_team_hiers(group_channel: group_channel, role_user_prod: role_user_prod, pmi_short_name: 'Two')
  end

  def self.sub_teams_measures(group_channel:, role_user_prod:)
    fetch_sub_team_hiers(group_channel: group_channel, role_user_prod: role_user_prod)
  end

  def self.my_lead_measures(group_channel:, role_user_prod:, lead:)
    fetch_my_lead_hiers(group_channel: group_channel, role_user_prod: role_user_prod, lead_level: lead)
  end

  def self.my_colleagues_measures(group_channel:, role_user_prod:, lead:)
    fetch_colleague_hiers(group_channel: group_channel, role_user_prod: role_user_prod, lead_level: lead)
  end

end
