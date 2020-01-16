class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.page(params[:page])
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place_op = PlaceOp::Create.(model_params: place_params, owner: current_user)
    respond_to do |format|
      if @place_op.success?
        @place = @place_op.value!
        format.html { redirect_to @place, notice: t("common.flash.created") }
        format.json { render :show, status: :created, location: @place }
      else
        @place = @place_op.failure
        format.html { render :new }
        format.json { render json: @place, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    @place_op = PlaceOp::Update.(model_object: @place, model_params: place_params,
                                 owner: current_user)
    respond_to do |format|
      if @place_op.success?
        @place = @place_op.value!
        format.html { redirect_to @place, notice: t("common.flash.updated") }
        format.json { render :show, status: :ok, location: @place }
      else
        @place = @place_op.failure
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place_op = PlaceOp::Destroy.(model_object: @place, owner: current_user)
    respond_to do |format|
      if @place_op.success?
        format.html { redirect_to places_url, notice: t("common.flash.destroyed") }
        format.json { head :no_content }
      else
        @place = @place_op.failure
        format.html { redirect_to @place, notice: 
                    t("common.flash.cannot_destroy", reason: @place.base_errors) }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id]).decorate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name)
    end

    def context_icon
      @context_icon = "fa fa-building"
    end
end
