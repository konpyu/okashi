# frozen_string_literal: true

class Api::V1::ItemsController < Api::BaseController
  def create
    item = Item.new(item_params)
    item.user_id = 1
    item.save!
    render json: {}
  end

  def index
    render plain: :ok
  end

  private

  def item_params
    params.permit(:comment, :title)
  end
end