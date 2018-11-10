class CreateEventAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendees do |t|
    	t.integer :attended_event_id
    	t.integer :event_attendee_id
    	t.timestamps null: false
   end
  end
end
