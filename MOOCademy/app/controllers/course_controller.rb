class CourseController < ApplicationController

  def home
  end

  def courses
    @name = params[:name]
  end

  def lessons
    @name = params[:name]
  end

end
