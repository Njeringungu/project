class DonorsController < ApplicationController

# before_action :authorize_donor
# skip_before_action :authorize_donor, only: [:create]


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

 def authorized_donor
        decoded_token = decode_token()
        if decoded_token
            donor_id = decoded_token[0]['donor_id']
          donor= Donor.find_by(id: donor_id)
        end
    end

   def donor_logged_in?
    !!authorized_donor
end
    def authorize_donor
     render json: { message: 'Donor only.' }, status: :unauthorized unless donor_logged_in?
    end

def create
        donor = Donor.create!(donor_params)

        if donor.valid?
            token = encode_token({ donor_id: donor.id })
            render json: { donor: donor, token: token }, status: :ok
        else
            render json: { error: 'Invalid name or password' }, status: :unprocessable_entity
        end
    end

    def login
        donor =  Donor.find_by(email: params[:email])

        if donor && donor.authenticate(params[:password])
            token = encode_token({ donor_id: donor.id })
            render json: { donor: donor, token: token }, status: :ok
        else
            render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
        end
    end

    def index
    
        render json: Donor.all
    end
    def show
donor = find_donor
render json: donor
    end
    def index
        render json: Donor.all
    end

    def update
    donor = find_donor
     donor.update!(donor_params)
    render json: donor
end

def logout
    session.delete(:email)
    render json: {
    message: "Goodbye"
    }, status: 200
end

    private
def find_donor
   Donor.find(params[:id])
end
    def donor_params
        params.permit(:email, :password, :first_name, :last_name, :reminder, :donate, :mode_of_donation, :frequency, :status )
    end
    
end