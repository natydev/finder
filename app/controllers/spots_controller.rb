# frozen_string_literal: true

class SpotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place
  before_action :set_spot, only: %i[show edit update destroy]

  # GET /spots
  # GET /spots.json
  def index
    @spots = Spot.all
  end

  # GET /spots/1
  # GET /spots/1.json
  def show; end

  # GET /spots/new
  def new
    @spot = @place.spots.new.decorate
  end

  # GET /spots/1/edit
  def edit; end

  # POST /spots
  # POST /spots.json
  def create
    params[:spot][:place_id] = @place.id
    @spot_op = SpotOp::Create.call(model_params: spot_params, owner: current_user)
    respond_to do |format|
      if @spot_op.success?
        @spot = @spot_op.value!
        format.html { redirect_to [@place, @spot], notice: t('common.flash.created') }
        format.json { render :show, status: :created, location: @spot }
      else
        @spot = @spot_op.failure.decorate
        format.html { render :new }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spots/1
  # PATCH/PUT /spots/1.json
  def update
    @spot_op = SpotOp::Update.call(model_object: @spot, model_params: spot_params,
                                   owner: current_user)
    respond_to do |format|
      if @spot_op.success?
        @spot = @spot_op.value!
        format.html { redirect_to [@place, @spot], notice: t('common.flash.updated') }
        format.json { render :show, status: :ok, location: @spot }
      else
        @spot = @spot_op.failure.decorate
        format.html { render :edit }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spots/1
  # DELETE /spots/1.json
  def destroy
    @spot_op = SpotOp::Destroy.call(model_object: @spot, owner: current_user)
    respond_to do |format|
      if @spot_op.success?
        format.html { redirect_to @place, notice: t('common.flash.destroyed') }
        format.json { head :no_content }
      else
        @spot = @spot_op.failure
        format.html do
          redirect_to @place, notice: t('common.flash.cannot_destroy'),
                              status: :unprocessable_entity
        end
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_spot
    @spot = Spot.find(params[:id]).decorate
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def spot_params
    params.require(:spot).permit(:place_id, :name, :code)
  end

  def context_icon
    @context_icon = Icon.css_for(:spot)
  end
end
