class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "thanks! we'll be in touch."
      redirect_to root_url
    end
  end
  
  private
  
    def contact_params
      params.require(:contact).permit(:content, :name, :email)
    end

end
