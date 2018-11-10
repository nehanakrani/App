class EventPolicy < ApplicationPolicy	
	def new
		is_admin? 
	end

	def show?
		is_admin? || is_user?
	end

	def create?
		is_admin? 
	end

	def update?
		is_admin? 
	end

	def edit?
		is_admin?
	end

	def destroy?
		is_admin? 
	end

	def index?
		is_user?
	end
end








