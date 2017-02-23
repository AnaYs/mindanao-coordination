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
      programs_based_on_location & programs_based_on_keyword
    elsif params[:location].present?
      programs_based_on_location
    elsif params[:search].present?
      programs_based_on_keyword
    else
      Program.all
    end
  end

  def programs_based_on_location
    Program.near(params[:location], 50).order("name")
  end

  def programs_based_on_keyword
    results = []
    PgSearch.multisearch(params[:search]).each do |document|
      results << document.searchable
    end
    results
  end

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:name, :main_office, :area_of_work, :organisation, :latitude, :longitude)
  end
end
