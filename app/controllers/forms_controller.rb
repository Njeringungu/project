class FormsController < ApplicationController
# before_action :authorize_admin, only: [:update]
# before_action :authorize_admin
# skip_before_action :authorize_charity, only: [:create, :index]



def show
form = find_form
render json: form
    end
    def index
        render json: Form.all
    end

def create
    form=Form.create!(form_params)
    render json: form
end

def update
    form = find_form
     form.update!(status: params[:status])
render json: form
end


private
def find_form
    Form.find(params[:id])
end
    def form_params
       params.permit(:name, :description, :category, :charity_id)
   end
end