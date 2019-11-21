class Admin::ContactsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@contacts = Contact.page(params[:page]).reverse_order
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
		if  @contact.status == "未対応"
			@contact.status = "対応済み"
			@contact.save
			redirect_to admin_contacts_path
		elsif @contact.status == "対応済み"
			@contact.status = "未対応"
			@contact.save
			redirect_to admin_contacts_path
		end
	end
end
