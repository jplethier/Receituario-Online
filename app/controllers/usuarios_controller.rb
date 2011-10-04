class UsuariosController < ApplicationController

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      render 'index'
    else
      render 'new'
    end
  end

  def index
    @usuarios = Usuario.all
  end

  def update
  end

  def edit
  end

end
