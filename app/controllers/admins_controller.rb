class AdminsController < ApplicationController
    

# before_action :authorize_admin



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

def authorized_admin
    decoded_token = decode_token()
    if decoded_token
        admin_id = decoded_token[0]['admin_id']
        admin = Admin.find_by(id: admin_id)
    end
end
def admin_logged_in?
    !!authorized_admin
end
    def authorize_admin
     render json: { message: 'Admin only.' }, status: :unauthorized unless admin_logged_in?
    end


def create
    admin = Admin.create!(admin_params)
    if admin.valid?
        token = encode_token({ admin_id: admin.id })
         render json: { admin: admin, token: token }, status: :ok
    else
        render json: { error: 'Invalid name or password' }, status: :unprocessable_entity
    end
end

def login
    admin =  Admin.find_by(email: params[:email])
    if admin && admin.authenticate(params[:password])
        token = encode_token({ admin_id: admin.id })
        render json: { admin: admin, token: token }, status: :ok
    else
         render json: { error: 'Invalid name or password' }, status: :unprocessable_entity
    end
end
 def index
    
        render json: Admin.all
    end


def logout
    session.delete(:email)
    render json: {
    message: "Goodbye"
    }, status: 200
end
private

def admin_params
    params.permit(:email, :password, :name, :password_confirmation)
    end
    

end
