class StudentsController < ApplicationController

  def index
    if params[:name]
      possible_first = Student.find_by(first_name: params[:name])
      possible_last = Student.find_by(last_name: params[:name])
      if possible_first
        students = [possible_first]
      elsif possible_last
        students = [possible_last]
      elsif possible_first.nil? && possible_last.nil?
        students = [{error: "student not found"}]
      end
    else
      students = Student.all
    end
    render json: students
  end

  def show
    render json: Student.find(params[:id])
  end

end
