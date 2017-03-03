class User < ActiveRecord::Base
  include PgSearch
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :program
  delegate :organisation, to: :program, prefix: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address, if: :latitude.nil?
  after_validation :geocode, if: :address_changed?

  multisearchable against: [:fullname, :email, :expertise, :program, :organisation]
end
