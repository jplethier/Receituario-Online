class MedicosController < ApplicationController
  
  def new
    @medico = Medico.new
    @medico.build_usuario
  end

  def create
    @medico = Medico.new(params[:medico])
    if @medico.save
      ClinicaMedico.create!(:clinica => clinica_corrente, :medico => @medico)
      redirect_to root_path
    else
      render 'new'
    end
  end

end
