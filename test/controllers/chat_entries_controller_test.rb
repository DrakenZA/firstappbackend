require 'test_helper'

class ChatEntriesControllerTest < ActionController::TestCase
  setup do
    @chat_entry = chat_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chat_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chat_entry" do
    assert_difference('ChatEntry.count') do
      post :create, chat_entry: { content: @chat_entry.content, name: @chat_entry.name }
    end

    assert_redirected_to chat_entry_path(assigns(:chat_entry))
  end

  test "should show chat_entry" do
    get :show, id: @chat_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chat_entry
    assert_response :success
  end

  test "should update chat_entry" do
    patch :update, id: @chat_entry, chat_entry: { content: @chat_entry.content, name: @chat_entry.name }
    assert_redirected_to chat_entry_path(assigns(:chat_entry))
  end

  test "should destroy chat_entry" do
    assert_difference('ChatEntry.count', -1) do
      delete :destroy, id: @chat_entry
    end

    assert_redirected_to chat_entries_path
  end
end
