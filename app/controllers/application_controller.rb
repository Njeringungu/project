class ApplicationController < ActionController::API
    
    

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
end
