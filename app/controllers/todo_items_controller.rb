class TodoItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]

  def create
    todo_item = @todo.todo_items.new(todo_item_params)

    if todo_item.save
      render json: todo_item, status: :created
    else
      render json: { error: todo_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @todo_item
  end

  def update
    if @todo_item.update(todo_item_params)
      render json: @todo_item
    else
      render json: { error: @todo_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_item.destroy
    head :no_content
  end

  private

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_todo_item
    @todo_item = @todo.todo_items.find(params[:id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:content)
  end
end
