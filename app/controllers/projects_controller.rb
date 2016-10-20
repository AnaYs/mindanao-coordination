class ProjectsController < ApplicationController
  before_action :set_program, only: [:index, :show, :new, :create, :edit, :update]
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = @program.projects.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = @program.projects.build(project_params)
    @project.save
    redirect_to program_project_path(@program, @project)
  end

  def edit
  end

  def update
    @project.update(project_params)

    redirect_to program_project_path(@program, @project)
  end

private
  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_project
    @project = @program.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:id, :name, :main_office, :area_of_work, :organisation, :program)
  end
end
