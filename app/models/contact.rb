class Contact < ApplicationRecord
	validates :last_name, presence: true
	validates :first_name, presence: true
	validates :last_name_ruby, presence: true
	validates :first_name_ruby, presence: true
	validates :email, presence: true
	validates :contact_body, presence: true
end
