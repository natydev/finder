class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Box.ransack(params[:q])
    @boxes = @q.result(distinct: true).includes(:spot, items: :tags)
    .left_joins(:items)
    .select(
      'boxes.id, boxes.summary, boxes.spot_id, boxes.code, boxes.typology, boxes.updated_at,
       items.box_id, items.id AS item_id, items.summary AS item_summary, items.updated_at AS item_updated_at'
    ).page(params[:page])
  end

  private

    def context_icon
      @context_icon = "fa fa-search"
    end
end
