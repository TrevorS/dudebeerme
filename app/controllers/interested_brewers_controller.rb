class InterestedBrewersController < ApplicationController

  def create
    @interested_brewer = InterestedBrewer.new(params[:interested_brewer])
    email = @interested_brewer.email
    if @interested_brewer.save
      flash[:success] = 'Thank you for signing up, we will email you soon!'
    else
      if email.empty?
        flash[:error] = 'You did not enter an email address!'
      elsif InterestedBrewer.find_by_email(email)
        flash[:notice] = 'This email address has already been registered.'
      else
        flash[:error] = 'Something went wrong, please try again.'
      end
    end
    redirect_to root_path
  end
end
