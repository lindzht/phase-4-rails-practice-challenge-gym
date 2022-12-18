class GymsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Gym.all, status: :ok
    end

    def show
        render json: find_gym, status: :ok
    end

    def update
        gym = find_gym
        gym.update!(gym_params)
        render json: gym, status: :created
    end

    def destroy
        gym = find_gym
        gym.destroy
        render json: {}, status: :ok
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def find_gym
        Gym.find(params[:id])
    end

    def not_found
        render json: {error: "Gym not found"}, status: :not_found
    end

end
