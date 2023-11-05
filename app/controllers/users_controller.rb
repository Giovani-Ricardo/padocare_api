class UsersController < ApplicationController
	
	# Cria um novo usuário
	def create
		@user = User.create(user_params)
		if @user.valid?
			render json: {user: @user, token: get_token }, status: :ok
		else
			render json: {error: 'Usuário inválido'}, status: :unprocessable_entity
		end
	end

	# Realiza o login do usuário, permitindo acesso ás rotas internas
	def login
		@user = User.find_by(email: user_params[:email])

		if @user && @user.authenticate(user_params[:password])
			render json: {user: @user, token: get_token}
		else
			render json: {error: 'Usuário inválido'}, status: :unprocessable_entity
		end
	end
  
	private

	# Método necessário para permitir os paremetros enviados na requisição
	# Por padrão o rails bloqueia todos os parametros
	def user_params
		params.permit(:name, :email, :password, :admin)
	end

	# Retorna token codificado para o usuário atual
	def get_token
		token = encode_token({user_id: @user.id})
	end
end
