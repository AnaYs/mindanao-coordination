class User < ActiveRecord::Base
  include PgSearch
  belongs_to :program
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  delegate :organisation, to: :program, prefix: true
  geocoded_by :address, if: :latitude.nil?
  after_validation :geocode, if: :address_changed?

  multisearchable against: [:fullname, :email, :expertise, :program, :organisation]
end
