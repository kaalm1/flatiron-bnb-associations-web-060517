class Listing < ActiveRecord::Base
  has_many :reservations
  has_many :reviews, through: :reservations, :foreign_key => 'guest_id'
  belongs_to :host, :class_name => "User"
  has_many :guests, :class_name => "User"
  belongs_to :neighborhood

  def guests
    self.reservations.map do |reservation|
      reservation.guest
    end
  end
end
