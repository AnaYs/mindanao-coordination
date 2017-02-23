class Project < ActiveRecord::Base
  has_many :activities
  belongs_to :program

  delegate :organisation, to: :program
  geocoded_by :main_office, if: :latitude.nil?
  after_validation :geocode, if: :main_office_changed?

  include PgSearch
  multisearchable against: [:name, :area_of_work, :organisation]
end
