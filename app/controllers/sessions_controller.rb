class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:name] == nil || params[:name] == ""
      redirect_to '/sessions/new'
    else
      session[:name] = params[:name]
      redirect_to '/'
    end
  end

  def destroy
    if session[:name]
      session.delete :name
    end

    redirect_to '/sessions/new'
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
