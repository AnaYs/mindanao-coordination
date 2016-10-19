class Program < ActiveRecord::Base
  has_many :profiles
  has_many :projects
  has_many :activities, through: :project
end
