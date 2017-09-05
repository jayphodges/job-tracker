class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)

    if @contact.save
      flash[:success] = "You've created a contact on #{@company.name}!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :position, :email, :company_id)
    end

end
