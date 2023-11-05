class SmartLockAccessesController < ApplicationController
  before_action :authozire

  # GET /acessos
  # Retorna o registro de acessos para a fechadura do usuário cadastrado
  def acessos
    @acessos = @user.smartlock.smart_lock_accesses.order('created_at desc')
    render json: @acessos
  end

  # POST /acesso/:type_id
  # Cria um registro de acesso para o usuário que está logado
  def create
    @acesso = @user.smartlock.smart_lock_accesses.create(user_id: @user.id, type_id: params[:type_id].to_i)
    if @acesso.valid?
      render json: @acesso, status: :ok
    else
      render json: {message: 'Criação falhou'}, status: :unprocessable_entity
    end
  end


  private

    # Método necessário para permitir os paremetros enviados na requisição
    # Por padrão o rails bloqueia todos os parametros
    def smart_lock_access_params
      params.require(:smart_lock_access).permit(:user_id, :smartlock_id, :type_id)
    end
end
