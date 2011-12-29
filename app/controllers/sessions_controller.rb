# coding: UTF-8
class SessionsController < ApplicationController
  
  def new
    
  end

  def show
  end

  def create
    @usuario = Usuario.authenticate(params[:session][:cpf_cnpj], params[:session][:senha])
    if @usuario
      sign_in @usuario
      if tipo_de_usuario == Usuario::MEDICO
        clinica_corrente = medico_corrente.clinicas.first
      end
      redirect_to root_path, :notice => "Login realizado com sucesso!"
    else
      flash.now[:error] = "Usuário não cadastrado ou senha errada."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path, :notice => "Fez logout com sucesso!"
  end

end
