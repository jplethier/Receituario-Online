class FarmaceuticosController < ApplicationController
  
  def new
    @farmaceutico = Farmaceutico.new
    @farmaceutico.build_usuario
  end

  def create
    @farmaceutico = Farmaceutico.new(params[:farmaceutico])
    if @farmaceutico.save
      FarmaciaFarmaceutico.create!(:farmacia => farmacia_corrente, :farmaceutico => @farmaceutico)
      redirect_to root_path
    else
      render 'new'
    end
  end

end
