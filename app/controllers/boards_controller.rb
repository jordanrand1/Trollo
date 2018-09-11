class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :edit, :destroy]
  def index
    @boards = current_user.boards
  end

  def show
  end

  def new
    @board = current_user.boards.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @board = current_user.boards.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @board.destroy
    binding.pry
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def set_board
    @board = current_user.boards.find(params[:id])
  end
  def board_params
    params.require(:board).permit(:name)
  end
end
