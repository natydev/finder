# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: %i[show edit update destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.order(:name).page(params[:page]).decorate
  end

  # GET /tags/1
  # GET /tags/1.json
  def show; end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit; end

  # POST /tags
  # POST /tags.json
  def create
    @tag_op = TagOp::Create.call(model_params: tag_params, owner: current_user)
    respond_to do |format|
      if @tag_op.success?
        @tag = @tag_op.value!
        format.html { redirect_to @tag, notice: t('common.flash.created') }
        format.json { render :show, status: :created, location: @tag }
      else
        @tag = @tag_op.failure
        format.html { render :new }
        format.json { render json: @tag, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    @tag_op = TagOp::Update.call(model_object: @tag, model_params: tag_params,
                                 owner: current_user)
    respond_to do |format|
      if @tag_op.success?
        @tag = @tag_op.value!
        format.html { redirect_to @tag, notice: t('common.flash.updated') }
        format.json { render :show, status: :ok, location: @tag }
      else
        @tag = @tag_op.failure
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag_op = TagOp::Destroy.call(model_object: @tag, owner: current_user)
    respond_to do |format|
      if @tag_op.success?
        format.html { redirect_to tags_url, notice: t('common.flash.destroyed') }
        format.json { head :no_content }
      else
        @tag = @tag_op.failure
        format.html do
          redirect_to @tag, notice: t('common.flash.cannot_destroy'),
                            status: :unprocessable_entity
        end
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id]).decorate
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name, :color, :background)
  end

  def context_icon
    @context_icon = Icon.css_for(:tag)
  end
end
