class User::ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to user_contact_complete_path
		else
			render :new
		end
	end

	def contact_complete
	end

	private
	def contact_params
		params.require(:contact).permit(:last_name, :first_name, :last_name_ruby, :first_name_ruby, :email, :contact_body)
	end

end
