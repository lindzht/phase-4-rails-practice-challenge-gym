class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def show
        client = Client.find(params[:id])
        # render json: client, methods: :total_charge ,  status: :ok
        render json: client, status: :ok
    end

    def index
        render json: Client.all, status: :ok
    end

    def update
        client = Client.find(params[:id])
        client.update!(client_params)
        render json: client, status: :created
    end

    private

    def not_found
        render json: {error: "Client not found"}, status: :not_found
    end

    def client_params
        params.permit(:name, :age)
    end


end
