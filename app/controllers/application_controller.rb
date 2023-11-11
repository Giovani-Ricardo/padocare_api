class ApplicationController < ActionController::API
	
	# Obter token para o usuário enviado como parametro
	def encode_token(payload)
		JWT.encode(payload, 'secret')
	end

	# Decodificando token enviado nas requisições utilizando o algoritmo HS256
	def decode_token
		auth_header = request.headers['Authorization']
		puts(request.headers['Authorization'])
		if auth_header
			token = auth_header.split(' ').last
		end
		begin
			JWT.decode(token, 'secret', true, algorithm: 'HS256')
		rescue JWT::DecodeError
			nil
		end
		
	end

	# Verifia se o usuário é valido através do token enviado
	def authorized_user
		decoded_token = decode_token()
		if decoded_token
			user_id = decoded_token[0]['user_id']
			@user = User.find_by(id: user_id)
		end
	end

	# Método utilizado para definir se um usuário está autenticado.
	def authozire
		render json: {message: 'Usuário não autenticado'}, status: :unauthorized unless authorized_user
	end
end
