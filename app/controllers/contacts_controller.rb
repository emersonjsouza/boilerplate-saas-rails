class ContactsController < ApplicationController
    def index
      @contacts = Contact.all
    end

    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_param)

      if @contact.save
        redirect_to contacts_path
      else
        render :new
      end
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy

      redirect_to contacts_path
    end

    private
    def contact_param
      params.require(:contact).permit(:firstname, :lastname, :phone)
    end
end
