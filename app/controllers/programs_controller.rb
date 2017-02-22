class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update]

  def index
    @programs = find_programs
    @hash = Gmaps4rails.build_markers(@programs) do |program, marker|
      marker.lat program.latitude
      marker.lng program.longitude
      marker.infowindow render_to_string(partial: "/programs/infowindow", locals: { program: program })
    end
  end

  def show
    @projects_hash = Gmaps4rails.build_markers(@program.projects) do |project, marker|
      marker.lat project.latitude
      marker.lng project.longitude
      # marker.infowindow render_to_string(partial: "/project/infowindow", locals: { project: project })
    end
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    @program.save

    redirect_to program_path(@program)
  end

  def edit
  end

  def update
    @program.update(program_params)

    redirect_to program_path(@program)
  end

private
  def find_programs

    if params[:location].present? && params[:search].present?
      @print = "Hello"
      Program.near(params[:location], 50).order("name")
    elsif params[:location].present?
      Program.near(params[:location], 50).order("name")
    elsif params[:search].present?
      @print = "Hello"
      Program.all
    else
      Program.all
    end
  end

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:name, :main_office, :area_of_work, :organisation, :latitude, :longitude)
  end
end
