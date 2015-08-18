class FactoidsController < ApplicationController
  before_action :set_factoid, only: [:show, :edit, :update, :destroy]

  # GET /factoids
  def index
    @factoids = Factoid.all
  end

  # GET /factoids/1
  def show
  end

  # GET /factoids/new
  def new
    @factoid = Factoid.new
  end

  # GET /factoids/1/edit
  def edit
  end

  # POST /factoids
  def create
    @factoid = Factoid.new(factoid_params)

    if @factoid.save
      redirect_to @factoid, notice: 'Factoid was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /factoids/1
  def update
    if @factoid.update(factoid_params)
      redirect_to @factoid, notice: 'Factoid was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /factoids/1
  def destroy
    @factoid.destroy
    redirect_to factoids_url, notice: 'Factoid was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factoid
      @factoid = Factoid.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def factoid_params
      params.require(:factoid).permit(:summary, :body, :note)
    end
end
