class BalconistasController < ApplicationController
  
  def new
    @balconista = Balconista.new
    @balconista.build_usuario
  end

  def create
    @balconista = Balconista.new(params[:balconista])
    if @balconista.save
      redirect_to root_path
    else
      render 'new'
    end
  end

end
