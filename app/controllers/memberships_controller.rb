class MembershipsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end


    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def invalid_entry(invalid)
        render json: {error: ErrorMessageSerializer.error_message(invalid.record.errors)}, status: :unprocessable_entity
    end

end
