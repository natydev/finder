# frozen_string_literal: true

class BoxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box, only: %i[show edit update destroy]

  # GET /boxes
  # GET /boxes.json
  def index
    @boxes = BoxDecorator.decorate_collection(
      Box.order_historical.page(params[:page])
    )
  end

  # GET /boxes/1
  # GET /boxes/1.json
  def show; end

  # GET /boxes/new
  def new
    @box = Box.new.decorate
  end

  # GET /boxes/1/edit
  def edit; end

  # POST /boxes
  # POST /boxes.json
  def create
    @box_op = BoxOp::Create.call(model_params: box_params, owner: current_user)
    respond_to do |format|
      if @box_op.success?
        @box = @box_op.value!
        format.html { redirect_to @box, notice: t('common.flash.created') }
        format.json { render :show, status: :created, location: @box }
      else
        @box = @box_op.failure
        format.html { render :new }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boxes/1
  # PATCH/PUT /boxes/1.json
  def update
    @box_op = BoxOp::Update.call(model_object: @box, model_params: box_params,
                                 owner: current_user)
    respond_to do |format|
      if @box_op.success?
        @box = @box_op.value!
        format.html { redirect_to @box, notice: t('common.flash.updated') }
        format.json { render :show, status: :ok, location: @box }
      else
        @box = @box_op.failure
        format.html { render :edit }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boxes/1
  # DELETE /boxes/1.json
  def destroy
    @box_op = BoxOp::Destroy.call(model_object: @box, owner: current_user)
    respond_to do |format|
      if @box_op.success?
        format.html { redirect_to boxes_url, notice: t('common.flash.destroyed') }
        format.json { head :no_content }
      else
        @box = @box_op.failure
        format.html do
          redirect_to box_url(@box), notice:
                    t('common.flash.cannot_destroy', reason: @box.base_errors)
        end
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_box
    @box = Box.find(params[:id]).decorate
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def box_params
    params.require(:box).permit(:spot_id, :owner_id, :summary, :volume,
                                :code, :issued_on, :typology, :picture, :quantity, :free_ratio,
                                :using, :notes, tag_ids: [])
  end

  def context_icon
    @context_icon = Icon.css_for(:box)
  end

  def picture_and_save
    @box.picture_derivatives! if @box.picture.present?
    @box.save
  end
end
