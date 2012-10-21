class CirculationsController < ApplicationController
  # GET /circulations
  # GET /circulations.json
  def index
    @circulations = Circulation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @circulations }
    end
  end

  # GET /circulations/1
  # GET /circulations/1.json
  def show
    @circulation = Circulation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @circulation }
    end
  end

  # GET /circulations/new
  # GET /circulations/new.json
  def new
    @circulation = Circulation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @circulation }
    end
  end

  # GET /circulations/1/edit
  def edit
    @circulation = Circulation.find(params[:id])
  end

  # POST /circulations
  # POST /circulations.json
  def create
    @circulation = Circulation.new(params[:circulation])

    respond_to do |format|
      if @circulation.save
        format.html { redirect_to @circulation, notice: 'Circulation was successfully created.' }
        format.json { render json: @circulation, status: :created, location: @circulation }
      else
        format.html { render action: "new" }
        format.json { render json: @circulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /circulations/1
  # PUT /circulations/1.json
  def update
    @circulation = Circulation.find(params[:id])

    respond_to do |format|
      if @circulation.update_attributes(params[:circulation])
        format.html { redirect_to @circulation, notice: 'Circulation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @circulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circulations/1
  # DELETE /circulations/1.json
  def destroy
    @circulation = Circulation.find(params[:id])
    @circulation.destroy

    respond_to do |format|
      format.html { redirect_to circulations_url }
      format.json { head :no_content }
    end
  end
end
