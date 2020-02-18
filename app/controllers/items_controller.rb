# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items/1
  # GET /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = @box.items.new.decorate
  end

  # GET /items/1/edit
  def edit; end

  # POST /items
  # POST /items.json
  def create
    params[:item][:box_id] = @box.id
    @item_op = ItemOp::Create.call(model_params: item_params, owner: current_user)
    respond_to do |format|
      if @item_op.success?
        @item = @item_op.value!
        format.html { redirect_to box_path(@box, anchor: 'related-list'), notice: t('common.flash.created') }
        format.json { render :show, status: :created, location: @item }
      else
        @item = @item_op.failure.decorate
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @item_op = ItemOp::Update.call(model_object: @item, model_params: item_params,
                                   owner: current_user)
    respond_to do |format|
      if @item_op.success?
        @item = @item_op.value!
        format.html { redirect_to [@box, @item], notice: t('common.flash.updated') }
        format.json { render :show, status: :ok, location: @item }
      else
        @item = @item_op.failure.decorate
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item_op = SpotOp::Destroy.call(model_object: @item, owner: current_user)
    respond_to do |format|
      if @item_op.success?
        format.html { redirect_to @box, notice: t('common.flash.destroyed') }
        format.json { head :no_content }
      else
        @item = @item_op.failure
        format.html do
          redirect_to @box, notice: t('common.flash.cannot_destroy'),
                            status: :unprocessable_entity
        end
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def set_box
    @box = Box.find(params[:box_id]).decorate
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id]).decorate
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:box_id, :summary, :picture,
                                 :quantity, :using, tag_ids: [])
  end

  def context_icon
    @context_icon = Icon.css_for(:item)
  end
end
