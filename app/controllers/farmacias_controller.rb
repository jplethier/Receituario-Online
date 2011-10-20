class FarmaciasController < ApplicationController
  
  def new
    @farmacia = Farmacia.new
  end

  def create
    @farmacia = Farmacia.new(params[:farmacia])
    debugger
    1
    if @farmacia.save
      redirect 'index'
    else
      render 'new'
    end
  end

  def index
  end

end
