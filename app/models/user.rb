class User < ApplicationRecord


	
	has_many :blogs
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         after_create :assign_default_role

          def assign_default_role
            self.add_role(:user) if self.roles.blank?
          end



         # after_create :default_role

         #   private
         #   debugger
         #   def default_role
         #     self.roles << Role.where(:name => 'User').first
         #   end
end
