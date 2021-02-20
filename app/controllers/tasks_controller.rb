class TasksController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
      @tasks = Task.all
    end

    def new
      board = Board.find(params[:board_id])
      @task = board.tasks.build
    end

    def create
      board = Board.find(params[:board_id])
      @task = board.tasks.build(task_params)
      @task.user_id = current_user.id
      if @task.save!
        redirect_to board_path(board)
      else
        render :new
      end
    end

    private
    def task_params
      params.require(:task).permit(:title, :content, :deadline)
    end
end