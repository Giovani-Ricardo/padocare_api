class SmartLockAccessesController < ApplicationController
  before_action :set_smart_lock_access, only: %i[ show update destroy ]

  # GET /smart_lock_accesses
  def index
    @smart_lock_accesses = SmartLockAccess.all

    render json: @smart_lock_accesses
  end

  # GET /smart_lock_accesses/1
  def show
    render json: @smart_lock_access
  end

  # POST /smart_lock_accesses
  def create
    @smart_lock_access = SmartLockAccess.new(smart_lock_access_params)

    if @smart_lock_access.save
      render json: @smart_lock_access, status: :created, location: @smart_lock_access
    else
      render json: @smart_lock_access.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /smart_lock_accesses/1
  def update
    if @smart_lock_access.update(smart_lock_access_params)
      render json: @smart_lock_access
    else
      render json: @smart_lock_access.errors, status: :unprocessable_entity
    end
  end

  # DELETE /smart_lock_accesses/1
  def destroy
    @smart_lock_access.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smart_lock_access
      @smart_lock_access = SmartLockAccess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def smart_lock_access_params
      params.require(:smart_lock_access).permit(:user_id, :smartlock_id, :type_id)
    end
end
