class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index
  def index
    find_programs
    @hash = Gmaps4rails.build_markers(@programs) do |program, marker|
      marker.lat program.latitude
      marker.lng program.longitude
      marker.infowindow render_to_string(partial: "/programs/infowindow", locals: { program: program })
    end
  end

  def show
    markers = @program.projects.empty? ? @program : @program.projects
    @projects_hash = Gmaps4rails.build_markers(markers) do |project, marker|
      marker.lat project.latitude
      marker.lng project.longitude
      marker.infowindow render_to_string(partial: "/projects/infowindow", locals: { project: project })
    end
    @users = User.where(program_id: @program.id)
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
    if params[:search].present?
      results_based_on_keyword
    elsif params[:location].present?
      @programs = programs_based_on_location
      @projects = projects_based_on_location
      @users = users_based_on_location
    else
      @programs = Program.all
    end
  end

  def programs_based_on_location
    Program.near(params[:location], 50).order("name")
  end

  def projects_based_on_location
    Project.near(params[:location], 50).order("name")
  end

  def users_based_on_location
    User.near(params[:location], 50).order("fullname")
  end

  def results_based_on_keyword
    @results = PgSearch.multisearch(params[:search])
    @programs = []
    @projects = []
    @users = []

    @results.each do |document|
      if document.searchable_type == "Program"
        @programs << document.searchable
      elsif document.searchable_type == "Project"
        @projects << document.searchable
      else
        @users << document.searchable
      end
    end
    if params[:location].present?
      @programs = (@programs & programs_based_on_location)
      @projects = (@projects & projects_based_on_location)
      @users = (@users & users_based_on_location)
    end
  end

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:name, :main_office, :area_of_work, :organisation, :latitude, :longitude)
  end
end
