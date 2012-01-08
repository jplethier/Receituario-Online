# coding: UTF-8
class MedicosController < ApplicationController
  
  def new
    @medico = Medico.new
    @medico.build_usuario
  end

  def create
    @medico = Medico.new(params[:medico])
    if @medico.save
      ClinicaMedico.create!(:clinica => clinica_corrente, :medico => @medico)
      redirect_to root_path, :notice => "Conta criada com sucesso"
    else
      flash.now[:error] = "Erro ao criar a conta"
      render 'new'
    end
  end

  def index
    @medicos = Medico.all
  end

  def show
    @medico = Medico.find(params[:id])
  end

  def alocar_medico
    medico = Medico.find(params[:id])
    clinica_medico = ClinicaMedico.new(:clinica => clinica_corrente, :medico => medico)
    if clinica_medico.validar_medico_clinica_unicos
      clinica_medico.save
      redirect_to root_path, :notice => "Médico alocado com sucesso!"
    else
      redirect_to clinica_medico_path(clinica_corrente, medico), :error => "Erro ao tentar alocar médico da clínica, por favor, tente novamente mais tarde!"
    end
  end

  def desalocar_medico
    medico = Medico.find(params[:id])
    clinica_medico = ClinicaMedico.por_medico_e_clinica(medico.id, clinica_corrente.id)
    if ClinicaMedico.destroy(clinica_medico)
      redirect_to root_path, :notice => "Médico desalocado com sucesso!"
    else
      redirect_to clinica_medico_path(clinica_corrente, medico), :error => "Erro ao tentar desalocar médico da clínica, por favor, tente novamente mais tarde!"
    end
  end

  def alterar_clinica
  end

  def salvar_clinica
    clinica_correte = Clinica.find(params["Clínica"])
    redirect_to root_path, :notice => "Clínica alterada com sucesso."
  end

end
