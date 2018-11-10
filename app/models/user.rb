class User < ApplicationRecord
#rolify add role
rolify
after_create :assign_default_role 
#relation for attend event 
has_many :events, foreign_key: 'user_id', class_name: 'Event'  ,dependent: :destroy
has_many :event_attendings, :foreign_key => :event_attendee_id
has_many :attended_events, :through => :event_attendings
#relation for picture uploder 
has_many :pictures, as: :imageable
accepts_nested_attributes_for :pictures
#Include default devise modules.
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
#validtion for user signin from
validates :name,  presence: true
#validates :phone_number, presence: true
#validates :gender, presence: { message: "must be selected" } 
#validates :dob, presence: { message: "(Date of Birth) must be entered" }   end
#when user singup then assign role
  def assign_default_role
    if self.roles.blank?
      self.add_role(:user)
    else
      self.add_role(:admin)
    end
  end

  def upcoming_events
		self.attended_events.upcoming
	end
	def past_events
		self.attended_events.past
	end
end

