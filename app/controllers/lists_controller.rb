class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :set_board

  def index
    @lists = @board.lists.order(created_at: :asc)
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def create
    @list = @board.lists.new(list_params)

    if @list.save
      redirect_to board_lists_path
    else
      render :new
    end
  end

  def edit
    render partial: 'partials/list_form'
  end

  def update
    if @list.update(list_params)
      redirect_to board_lists_path(@board.id)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to board_lists_path
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = Board.find(params[:board_id]).lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
