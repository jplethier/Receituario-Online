class FarmaciasController < ApplicationController
  
  def new
    @farmacia = Farmacia.new
    @farmacia.build_usuario
  end

  def create
    @farmacia = Farmacia.new(params[:farmacia])
    if @farmacia.save
      redirect_to root_path, :notice => "Conta criada com sucesso"
    else
      flash.now[:error] = "Erro ao criar a conta"
      render 'new'
    end
  end

  def index
  end

  def show
  end

  def funcionarios
    farmacia_farmaceuticos = FarmaciaFarmaceutico.por_farmacia(farmacia_corrente)
    @funcionarios = Array.new
    farmacia_farmaceuticos.each do |ff|
      @funcionarios += [ff.farmaceutico]
    end

    balconista_farmacia = BalconistaFarmacia.por_farmacia(farmacia_corrente)
    balconista_farmacia.each do |bf|
      @funcionarios += [bf.balconista]
    end
  end

end
