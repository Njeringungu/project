class DonationsController < ApplicationController


    def index
        render json: Donation.all, status: :ok  
    end


    def create
        donation = Donation.create!(donation_params)
        render json: donation
    end

    def show
        donation = Donation.find_by!(id: params[:id])
        render json: donation, status: :ok
    end

    private

    def donation_params
     params.permit(:amount, :charity_id, :donor_id)
    end

end