class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Box.ransack(params[:q])
    @boxes = if @q.conditions.present?
      @display = true
      @q.result()
      .includes(:spot, items: :tags)
      .left_joins(:items)
      .where(owner_id: current_user.id)
      .select(
        'boxes.id, boxes.summary, boxes.spot_id, boxes.code, boxes.typology,
         boxes.updated_at, boxes.picture_data, items.box_id, items.id AS item_id, 
         items.summary AS item_summary, items.updated_at AS item_updated_at,
         items.picture_data AS item_picture_data'
      ).page(params[:page])
    else
      @display = false
    end
  end

  private

    def context_icon
      @context_icon = "fa fa-search"
    end
end
