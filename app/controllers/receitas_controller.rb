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

end
