class BalconistasController < ApplicationController
  
  def new
    @balconista = Balconista.new
    @balconista.build_usuario
  end

  def create
    @balconista = Balconista.new(params[:balconista])
    if @balconista.save
      BalconistaFarmacia.create!(:balconista => @balconista, :farmacia => farmacia_corrente)
      redirect_to root_path
    else
      render 'new'
    end
  end

end
