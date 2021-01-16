class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params(:subject, :readme))
    @course.save
    redirect_to course_path(@course)
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params(:subject, :readme))
    redirect_to course_path(@course)
  end

  def destroy
    Course.find(params[:id]).destroy
    redirect_to courses_path
  end

  private

  def course_params(*args)
    params.require(:course).permit(*args)
  end
end
