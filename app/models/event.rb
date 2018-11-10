class Event < ApplicationRecord
belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
#realtion of event attending
	has_many :event_attendings, :foreign_key => :attended_event_id
	has_many :attendees, :through => :event_attendings, :source => :event_attendee
#realtion of hasmany picture
	has_many :pictures, as: :imageable
	accepts_nested_attributes_for :pictures
	mount_uploader :picture, PictureUploader
#validation		
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :title, presence: true,
	                    length: { maximum: 50 }
	validates :description, length: { maximum: 1000 }
	validates :location, presence: true, 
	                    length: { maximum: 50 }
#where query for find date and time wise event record
	scope :upcoming, -> { where("date >= ?", Time.now).order('date ASC') }
	scope :past, -> { where("date < ?", Time.now).order('date DESC') }
end
