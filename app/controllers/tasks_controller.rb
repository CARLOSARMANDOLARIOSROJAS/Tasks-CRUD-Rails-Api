class TasksController < ApplicationController
    before_action :set_task, only: [:show, :update, :destroy]

    # Metodo GET
    def index
        @tasks = Task.all
        render json: @tasks
    end

    # Metodo GET por ID
    def show
        render json: @task
    end

    # Metodo POST
    def create
        task = Task.new(task_params)  # Aquí estamos creando la instancia de Task
        if task.save  # Verifica que 'task' no sea nil antes de llamar a save
          render json: task, status: :created
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

    # Metodo PUT

    def update
        if @task.update(task_params)
            render json: @task
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    # Metodo DELETE
    def destroy
        @task.destroy
        head :no_content
    end

    private

    def task_params
        # Asegúrate de incluir los parámetros que quieres permitir
        params.require(:task).permit(:title, :description, :completed)
    end

    def set_task
        @task = Task.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Task not found' }, status: :not_found
    end

end
