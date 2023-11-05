class UsersController < ApplicationController
	
	def create
		@user = User.create(user_params)
		if @user.valid?
			token = encode_token({user_id: @user.id})
			render json: {user: @user, token: token }, status: :ok
		else
			puts(@user.errors)
			render json: {error: 'Usuário inválido'}, status: :unprocessable_entity
		end
	end
  
	private

	def user_params
		params.permit(:name, :email, :password, :admin)
	end
end
