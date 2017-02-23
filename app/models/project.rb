class Project < ActiveRecord::Base
  include PgSearch
  has_many :activities
  belongs_to :program

  delegate :organisation, to: :program, prefix: true
  geocoded_by :main_office, if: :latitude.nil?
  after_validation :geocode, if: :main_office_changed?

  multisearchable against: [:name, :area_of_work, :organisation]

end
