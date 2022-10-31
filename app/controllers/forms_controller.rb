class FormsController < ApplicationController
before_action :authorize_admin, only: [:update, :index]
# before_action :authorize_admin
skip_before_action :authorize_charity, only: [:create, :index]

def encode_token(payload)
        
    JWT.encode(payload, 'secret')
end

def decode_token
     auth_header = request.headers['Authorization']
    if auth_header
        token = auth_header.split(' ')[1]
    begin
    JWT.decode(token, 'secret', true, algorithm: 'HS256')
    rescue JWT::DecodeError 
        nil
    end
    end
end
def authorized_charity
        decoded_token = decode_token()
        if decoded_token
            charity_id = decoded_token[0]['charity_id']
          charity= Charity.find_by(id: charity_id)
        end
    end

    def charity_logged_in?
    !!authorized_charity
end
    def authorize_charity
     render json: { message: 'Charity only.' }, status: :unauthorized unless charity_logged_in?
    end

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