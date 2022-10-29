class BeneficiariesController < ApplicationController
     def index
        render json: Beneficiary.all
    end

    def create
        beneficiary = Beneficiary.create!(beneficiary_params)
        render json: beneficiary
    end

    private

    def beneficiary_params
        params.permit(:name, :stories, :amount, :image, :charity_id)
    end
end
