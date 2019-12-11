class SpotsController < ApplicationController
  before_action :set_place
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  # GET /spots
  # GET /spots.json
  def index
    @spots = Spot.all
  end

  # GET /spots/1
  # GET /spots/1.json
  def show
  end

  # GET /spots/new
  def new
    @spot = @place.spots.new
  end

  # GET /spots/1/edit
  def edit
  end

  # POST /spots
  # POST /spots.json
  def create
    @spot = @place.spots.
      new(spot_params)
    respond_to do |format|
      if @spot.save
        format.html { redirect_to [@place, @spot], notice: t("common.flash.created") }
        format.json { render :show, status: :created, location: @spot }
      else
        format.html { render :new }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spots/1
  # PATCH/PUT /spots/1.json
  def update
    respond_to do |format|
      if @spot.update(spot_params)
        format.html { redirect_to [@place, @spot], notice: t("common.flash.updated") }
        format.json { render :show, status: :ok, location: @spot }
      else
        format.html { render :edit }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spots/1
  # DELETE /spots/1.json
  def destroy
    @spot.destroy
    respond_to do |format|
      format.html { redirect_to place_spots_path(place: @place), notice: t("common.flash.destroyed") }
      format.json { head :no_content }
    end
  end

  private
    def set_place
      @place = Place.find(params[:place_id])
    end

    def set_spot
      @spot = Spot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_params
      params.require(:spot).permit(:place_id, :name, :slug)
    end

    def context_icon
      @context_icon = "fa fa-door-open"
    end
end
