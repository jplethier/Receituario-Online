class ReceitasController < ApplicationController
  
  def new
    @receita = Receita.new
    @pacientes = Paciente.all
  end

  def create
    @receita = Receita.new(params[:receita])
    @receita.medico = medico_corrente
    @receita.clinica = clinica_corrente
    if @receita.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @receita = Receita.find(params[:id])
  end

  def update
    @receita = Receita.find(params[:id])
    if Receita.update(@receita, params[:receita])
      redirect_to root_path, :notice => "Receita atualizada com sucesso!"
    else
      flash.now[:error] = "Erro ao atualizar oferta, tente novamente mais tarde!"
      render "edit"
    end
  end

  def index
    @receitas = Receita.all
  end

  def atender
    atendente = farmaceutico_corrente if tipo_de_usuario == Usuario::FARMACEUTICO
    atendente = balconista_corrente if tipo_de_usuario == Usuario::BALCONISTA
    @receita = Receita.find(params[:receita_id])
    if @receita.atender(atendente, farmacia_corrente)
      redirect_to root_path
    else
      render 'show'
    end
  end

  def show
    @receita = Receita.find(params[:id])
  end

end
