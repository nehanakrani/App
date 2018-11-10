class Role < ApplicationRecord
has_and_belongs_to_many :users, :join_table => :users_roles
#add role for user for authorization 
belongs_to :resource,:polymorphic => true,:optional => true
#validation for rolify 
validates :resource_type,:inclusion => { :in => Rolify.resource_types },:allow_nil => true
scopify
end
