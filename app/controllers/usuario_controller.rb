class UsuarioController < ApplicationController
  
  def new
    @usuario = Usuario.new
  end

  def index
    @usuarios = Usuario.all
  end

  def show
  end

  def create
    
  end

  def edit
  end

  def update
  end

end
