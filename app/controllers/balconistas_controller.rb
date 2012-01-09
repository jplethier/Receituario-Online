# coding: UTF-8
class BalconistasController < ApplicationController
  
  def new
    @balconista = Balconista.new
    @balconista.build_usuario
  end

  def create
    @balconista = Balconista.new(params[:balconista])
    if @balconista.save
      BalconistaFarmacia.create!(:balconista => @balconista, :farmacia => farmacia_corrente)
      redirect_to root_path, :notice => "Conta criada com sucesso"
    else
      flash.now[:error] = "Erro ao criar a conta"
      render 'new'
    end
  end

  def alocar_balconista
    balconista = Balconista.find(params[:id])
    balconista_farmacia = BalconistaFarmacia.new(:farmacia => farmacia_corrente, :balconista => balconista)
    if balconista_farmacia.validar_farmacia_balconista_unicos
      balconista_farmacia.save
      redirect_to root_path, :notice => "Balconista alocado com sucesso!"
    else
      redirect_to farmacia_balconista_path(farmacia_corrente, balconista), :error => "Erro ao tentar alocar balconista da farmácia, por favor, tente novamente mais tarde!"
    end
  end

  def desalocar_balconista
    balconista = Balconista.find(params[:id])
    balconista_farmacia = BalconistaFarmacia.por_balconista_e_farmacia(balconista.id, farmacia_corrente.id)
    if BalconistaFarmacia.destroy(balconista_farmacia)
      redirect_to root_path, :notice => "Balconista desalocado com sucesso!"
    else
      redirect_to farmacia_balconista_path(farmacia_corrente, balconista), :error => "Erro ao tentar desalocar balconista da farmácia, por favor, tente novamente mais tarde!"
    end
  end

  def show
    @balconista = Balconista.find(params[:id])
  end

  def index
    @balconistas = Balconista.all
  end

  def alterar_farmacia
  end

  def salvar_farmacia
    farmacia_corrente = Farmacia.find(params["Farmácia"])
    redirect_to root_path, :notice => "Farmácia alterada com sucesso."
  end


end
