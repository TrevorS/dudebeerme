class InterestedBrewersController < ApplicationController

  def create
    @interested_brewer = InterestedBrewer.new(params[:interested_brewer])
    email = @interested_brewer.email
    if @interested_brewer.save
      flash[:success] = 'Thank you for signing up, we will email you soon!'
    else
      if InterestedBrewer.find_by_email(email)
        flash[:notice] = "You've already registered this email address!"
      else
        flash[:error] = 'Something went wrong, please try again.'
      end
    end
    redirect_to root_path
  end
end
