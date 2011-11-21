class PacientesController < ApplicationController
  
  def new
    @paciente = Paciente.new
    @paciente.build_usuario
  end

  def create
    @paciente = Paciente.new(params[:paciente])
    if @paciente.save
      redirect_to root_path
    else
      render 'new'
    end
  end

end
