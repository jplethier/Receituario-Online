class ClinicasController < ApplicationController
  
  def new
    @clinica = Clinica.new
    @clinica.build_usuario
  end

  def create
    @clinica = Clinica.new(params[:clinica])
    if @clinica.save
      render 'new'
    else
      render 'new'
    end
  end

end
