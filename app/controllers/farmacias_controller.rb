class FarmaciasController < ApplicationController
  
  def new
    @farmacia = Farmacia.new
    @farmacia.build_usuario
  end

  def create
    @farmacia = Farmacia.new(params[:farmacia])
    if @farmacia.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
  end

  def show
  end

end
