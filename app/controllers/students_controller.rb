class StudentsController < ApplicationController

  def index
    if params[:name]
      if Student.find_by(first_name: params[:name])
        students = Student.find_by(first_name: params[:name])
      else
        students = Student.find_by(last_name: params[:name])
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
