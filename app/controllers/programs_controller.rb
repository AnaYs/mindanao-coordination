class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update]

  def index
    @programs = Program.all
  end

  def show
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

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:name, :main_office, :area_of_work, :organisation, :latitude, :longitude)
  end
end
