class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    todos = Todo.all
    render json: todos
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo, status: :created
    else
      render json: { error: todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @todo
  end

  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: { error: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description)
  end
end