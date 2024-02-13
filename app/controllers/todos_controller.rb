class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  #get /todos
  def index 
    todos = Todo.all
    render json: todos
  end

  #post /todos
  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo, status: :created
    else
      render json: { error: todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #get /todos/:id
  def show
    render json: @todo
  end

  #put /todos/:id
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: { error: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #delete /todos/:id
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
