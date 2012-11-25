class StaticController < ApplicationController

  def coming_soon
    @interested_brewer = InterestedBrewer.new
  end

  def home
  end

  def faq
  end

  def about
  end

end
