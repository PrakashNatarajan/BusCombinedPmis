class GenericPmiTracking < ApplicationRecord

  validates :role_level, :role_user, :pmi_short_name, :source_type, :start_value, :target_value, :target_date, presence: true

=begin
  def build_pri_guid
    SecureRandom.hex
  end
=end

  before_create do
    self.guid = SecureRandom.hex
    self.track_status = 'Started'
    self.start_date = DateTime.now
  end

end
