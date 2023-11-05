class UsersController < ApplicationController
	
	def create
		@user = User.create(user_params)
		if @user.valid?
			render json: {user: @user, token: get_token }, status: :ok
		else
			render json: {error: 'Usuário inválido'}, status: :unprocessable_entity
		end
	end

	def login
		@user = User.find_by(email: user_params[:email])

		if @user && @user.authenticate(user_params[:password])
			render json: {user: @user, token: get_token}
		else
			render json: {error: 'Usuário inválido'}, status: :unprocessable_entity
		end
	end
  
	private

	def user_params
		params.permit(:name, :email, :password, :admin)
	end

	def get_token
		token = encode_token({user_id: @user.id})
	end
end
