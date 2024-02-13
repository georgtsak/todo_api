#ECHO is on.
require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new todo' do
        post :create, params: { todo: { title: 'Test Todo', description: 'Test description' } }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new todo' do
        post :create, params: { todo: { title: nil, description: 'Test description' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      todo = Todo.create(title: 'Test Todo', description: 'Test description')
      get :show, params: { id: todo.id }
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    let(:todo) { Todo.create(title: 'Test Todo', description: 'Test description') }

    context 'with valid parameters' do
      it 'updates the todo' do
        put :update, params: { id: todo.id, todo: { title: 'Updated Title' } }
        expect(todo.reload.title).to eq 'Updated Title'
      end
    end

    context 'with invalid parameters' do
      it 'does not update the todo' do
        put :update, params: { id: todo.id, todo: { title: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the todo' do
      todo = Todo.create(title: 'Test Todo', description: 'Test description')
      delete :destroy, params: { id: todo.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
