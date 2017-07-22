# frozen_string_literal: true

class Api::V1::ItemsController < Api::BaseController
  def create
    item = Item.new(item_params)
    item.user_id = 1
    item.save!
    render json: item.to_json
  end

  def index
    render json: Item.limit(10).to_json
  end

  private

  def item_params
    params.permit(:comment, :title)
  end
end