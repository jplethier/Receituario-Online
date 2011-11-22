class ReceitasController < ApplicationController
  
  def new
    @receita = Receita.new
    @pacientes = Paciente.all
  end

  def create
    @receita = Receita.new(params[:receita])
    @receita.medico = medico_corrente
    if @receita.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    
  end

  def index
    @receitas = Receita.all
  end

  def atender
    @receita.atendente = farmaceutico_corrente if tipo_de_usuario == Usuario::FARMACEUTICO
    @receita.atendente = balconista_corrente if tipo_de_usuario == Usuario::BALCONISTA
    @receita.farmacia = farmacia_corrente
  end

  def show
  end

end
