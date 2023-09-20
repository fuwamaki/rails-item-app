# frozen_string_literal: true

# Description/Explanation of SimpleItems class
class SimpleItemsController < ApplicationController
  def index
    @simple_items = SimpleItem.all
    render json: @simple_items, status: :ok
  end

  def create
    simple_item_params = params.require(:simple_item).permit(:title)
    simple_item = SimpleItem.new(simple_item_params)
    if simple_item.save
      render json: simple_item, status: :created
    else
      render json: simple_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @simple_item = SimpleItem.find(params[:id])
    @simple_item.destroy
    render status: :no_content
  end

  def update
    @simple_item = SimpleItem.find(params[:id])
    simple_item_params = params.require(:simple_item).permit(:title)
    if @simple_item.update(simple_item_params)
      render json: @simple_item, status: :ok
    else
      render json: @simple_item.errors, status: :unprocessable_entity
    end
  end
end
