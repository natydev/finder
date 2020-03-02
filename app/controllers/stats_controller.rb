# frozen_string_literal: true

class StatsController < ApplicationController
  before_action :authenticate_user!

  def index
    table = PaperTrail::Version.arel_table
    @latest_updates = VersionDecorator.decorate_collection(
      PaperTrail::Version.includes(:item)
      .select('item_id, item_type, created_at').from(
        PaperTrail::Version
          .select('DISTINCT ON (item_id) item_id, item_type, created_at')
          .where(
            table[:item_type].eq('Box').or(table[:item_type].eq('Item'))
          )
          .where(
            table[:event].eq('update')
          )
      ).order('created_at desc').limit(15)
    )
  end

private

  def context_icon
    @context_icon = Icon.css_for(:stats, style: 'fa')
  end
end
