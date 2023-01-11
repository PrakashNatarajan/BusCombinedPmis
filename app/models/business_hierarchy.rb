class BusinessHierarchy < ApplicationRecord
  self.table_name = "business_role_hierarchies"
  self.primary_key = "role_user_prod"

  has_many :subordinates, class_name: "BusinessHierarchy", foreign_key: "role_lead_prod"
  belongs_to :lead_super, class_name: "BusinessHierarchy", foreign_key: "role_user_prod"

  hier_file_path = File.read("#{Dir.pwd}/db/bus_hiers_maps.json")
  HIER_PROD_MAPS = JSON.parse(hier_file_path)

  def self.fetch_sub_users(lead_level:, lead_user:, lead_prod:)
    
  end

  def self.fetch_lead_role(role_level:)
    HIER_PROD_MAPS['HIER_BOSS_ROLES'][role_level]
  end

end
