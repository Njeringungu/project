class CharitiesController < ApplicationController

#    before_action :authorize_charity
# skip_before_action :authorize_charity, only: [:create]



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

    def create
      charity =Charity.create!(charity_params)
       if charity.valid?
           token = encode_token({charity_id:charity.id })
           render json: {charity:charity, token: token }, status: :ok
       else
           render json: { error: 'Invalid name or password' }, status: :unprocessable_entity
       end
   end
   def login
      charity = Charity.find_by(email: params[:email])
       if charity &&charity.authenticate(params[:password])
           token = encode_token({charity_id:charity.id })
           render json: {charity:charity, token: token }, status: :ok
       else
           render json: { error: 'Invalid name or password' }, status: :unprocessable_entity
       end
   end

   def index
    
        render json: Charity.all
    end



 def logout
    session.delete(:email)
    render json: {
    message: "Goodbye"
    }, status: 200
end

   private
   def charity_params
       params.permit(:email, :password, :name, :description, :amount_donated, :target_amount)
   end
  
end
