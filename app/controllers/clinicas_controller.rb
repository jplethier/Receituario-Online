class ClinicasController < ApplicationController
  
  def new
    @clinica = Clinica.new
    @clinica.build_usuario
  end

  def create
    @clinica = Clinica.new(params[:clinica])
    if @clinica.save
      redirect_to root_path, :notice => "Conta criada com sucesso"
    else
      flash.now[:error] = "Erro ao criar a conta"
      render 'new'
    end
  end

  def show
  end

  def medicos_da_clinica
    clinicas_medicos = ClinicaMedico.por_clinica(clinica_corrente)
    @medicos = Array.new
    clinicas_medicos.each do |cm|
      @medicos += [cm.medico]
    end
  end

end
