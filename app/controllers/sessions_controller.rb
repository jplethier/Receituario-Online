class SessionsController < ApplicationController
  
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.authenticate(params[:session][:email], params[:session][:senha])
    if @usuario
      sign_in user
      redirect_to root_path
    else
      #erro
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
