class Project < ActiveRecord::Base
  has_many :activities
  belongs_to :program

  delegate :organisation, to: :program
end
