# frozen_string_literal: true

class StatsController < ApplicationController
  before_action :authenticate_user!

  def index
    table = PaperTrail::Version.arel_table
    @latest_updates = VersionDecorator.decorate_collection(
      PaperTrail::Version.includes(:item)
        .select('DISTINCT ON (item_id) item_id, item_type, created_at')
        .where(
          table[:item_type].eq('Box').or(table[:item_type].eq('Item'))
        )
        .where(
          table[:event].eq('update')
        )
        .limit(20).order(table[:item_id]).to_a
        .sort_by(&:created_at).reverse
    )
  end

private

  def context_icon
    @context_icon = Icon.css_for(:stats, style: 'fa')
  end
end
