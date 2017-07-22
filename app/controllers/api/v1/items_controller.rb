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

  def destroy
    item = set_item
    item.destroy!
    render json: item, status: 204
  end

  private

  def set_item
    Item.find(params[:id])
  end

  def item_params
    params.permit(:comment, :title)
  end
end