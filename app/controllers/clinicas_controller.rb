class ClinicasController < ApplicationController
  
  def new
    @clinica = Clinica.new
    @clinica.build_usuario
  end

  def create
    @clinica = Clinica.new(params[:clinica])
    if @clinica.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

end
