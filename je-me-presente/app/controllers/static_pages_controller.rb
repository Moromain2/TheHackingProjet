class StaticPagesController < ApplicationController

  def home

  end

  def contact

  end

  def about
    @name = params[:name]
  end

end
