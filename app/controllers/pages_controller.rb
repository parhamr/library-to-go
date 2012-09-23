# encoding: utf-8

class PagesController < ApplicationController

  def home
    
  end

  def show
    @page = Page.where(slug: params[:slug]).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end
end
