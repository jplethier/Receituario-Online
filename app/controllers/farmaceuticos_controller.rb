# coding: UTF-8
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

  def alocar_farmaceutico
    farmaceutico = Farmaceutico.find(params[:id])
    farmacia_farmaceutico = FarmaciaFarmaceutico.new(:farmacia => farmacia_corrente, :farmaceutico => farmaceutico)
    if farmacia_farmaceutico.validar_farmacia_farmaceutico_unicos
      farmacia_farmaceutico.save
      redirect_to root_path, :notice => "Farmacêutico alocado com sucesso!"
    else
      redirect_to farmacia_farmaceutico_path(farmacia_corrente, farmaceutico), :error => "Erro ao tentar alocar farmacêutico da farmácia, por favor, tente novamente mais tarde!"
    end
  end

  def desalocar_farmaceutico
    farmaceutico = Farmaceutico.find(params[:id])
    farmacia_farmaceutico = FarmaciaFarmaceutico.por_farmaceutico_e_farmacia(farmaceutico.id, farmacia_corrente.id)
    if FarmaciaFarmaceutico.destroy(farmacia_farmaceutico)
      redirect_to root_path, :notice => "Farmacêutico desalocado com sucesso!"
    else
      redirect_to farmacia_farmaceutico_path(farmacia_corrente, farmaceutico), :error => "Erro ao tentar desalocar farmacêutico da farmácia, por favor, tente novamente mais tarde!"
    end
  end

  def show
    @farmaceutico = Farmaceutico.find(params[:id])
  end

  def index
    @farmaceuticos = Farmaceutico.all
  end

end
