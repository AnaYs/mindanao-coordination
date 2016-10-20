class Program < ActiveRecord::Base
  has_many :profiles
  has_many :projects
  has_many :activities, through: :project

  geocoded_by :main_office, if: :latitude.nil?
  after_validation :geocode, if: :main_office_changed?
  validates :name, :main_office, :latitude, :longitude, presence: true
end

