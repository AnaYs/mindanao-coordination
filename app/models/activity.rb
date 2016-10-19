class Activity < ActiveRecord::Base
  belongs_to :project
  delegate :program, to: :project
end
