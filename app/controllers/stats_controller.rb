# frozen_string_literal: true

class StatsController < ApplicationController
  before_action :authenticate_user!

  def index
    table = PaperTrail::Version.arel_table
    @latest_updates = VersionDecorator.decorate_collection(
      PaperTrail::Version.includes(:item)
        .where(
          table[:item_type].eq('Box').or(table[:item_type].eq('Item'))
        )
        .where(
          table[:event].eq('update')
        )
        .limit(20).order(table[:created_at].desc).to_a
    )
  end

private

  def context_icon
    @context_icon = 'fa fa-chart-bar'
  end
end
