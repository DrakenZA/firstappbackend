class ChatEntriesController < ApplicationController
   before_action :set_chat_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /chat_entries
  # GET /chat_entries.json
  def index
    @chat_entries = ChatEntry.all
  end

  # GET /chat_entries/1
  # GET /chat_entries/1.json
  def show
  end

  # GET /chat_entries/new
  def new
    @chat_entry = ChatEntry.new
  end

  # GET /chat_entries/1/edit
  def edit
  end

  # POST /chat_entries
  # POST /chat_entries.json
  def create

    @chat_entry = ChatEntry.new(chat_entry_params)




    respond_to do |format|
      if @chat_entry.save
        format.html { redirect_to @chat_entry, notice: 'Chat entry was successfully created.' }
        format.json { render :show, status: :created, location: @chat_entry }
        clientfaye = Faye::Client.new('http://drakenfaye.herokuapp.com/faye')
        clientfaye.publish('/cmds', :command => 'refresh')

      else
        format.html { render :new }
        format.json { render json: @chat_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chat_entries/1
  # PATCH/PUT /chat_entries/1.json
  def update
    respond_to do |format|
      if @chat_entry.update(chat_entry_params)
        format.html { redirect_to @chat_entry, notice: 'Chat entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat_entry }
      else
        format.html { render :edit }
        format.json { render json: @chat_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_entries/1
  # DELETE /chat_entries/1.json
  def destroy




    @chat_entry.destroy
    clientfaye = Faye::Client.new('http://drakenfaye.herokuapp.com/faye')
    clientfaye.publish('/cmds', :command => 'refresh')
    respond_to do |format|
      format.html { redirect_to chat_entries_url, notice: 'Chat entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_entry
      @chat_entry = ChatEntry.find(params[:id])
    end

    def checkaccess
      if current_user == nil
        return
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_entry_params
      params.require(:chat_entry).permit(:name, :content)
    end
end
