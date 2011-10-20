class FarmaciasController < ApplicationController
  
  def new
    @farmacia = Farmacia.new
    @farmacia.build_usuario
  end

  def create
    @farmacia = Farmacia.new(params[:farmacia])
    debugger
    1
    if @farmacia.save
      redirect_to 'index'
    else
      render 'new'
    end
  end

  def index
  end

end
