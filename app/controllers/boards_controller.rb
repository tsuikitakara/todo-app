class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update]
  
    def index
      @boards = Board.all
    end

    def show
    end

    def new
      @board = Board.new
    end

    def create
      @board = Board.new(board_params)
      if @board.save
        redirect_to board_path(@board)
      else
        flash.now[:error] = 'Error'
        render :new
      end
    end

    def edit
    end

    def  update
      if @board.update(board_params)
        redirect_to board_path(@board)
      else
        flash.now[:error] = 'Error'
        render :edit
      end
    end

    def destroy
      board = Board.find(params[:id])
      board.destroy
      redirect_to root_path
    end

    private
    def board_params
      params.require(:board).permit(:title, :content)
    end

    def set_board
      @board = Board.find(params[:id])
    end
end