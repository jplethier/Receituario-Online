class SessionsController < ApplicationController
  
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if Usuario.authenticate(@usuario)
      #logar o usuario e salvar a sessao
      redirect_to root_path
    else
      #erro
      render 'new'
    end
  end

end
