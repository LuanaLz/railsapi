class Api::V1::PassageiroController < ApplicationController

 before_action :set_passageiro, only: [:show, :update, :destroy]

 before_action :require_authorization!, only: [:show, :update, :destroy]

 # GET /api/v1/passageiro

 def index

   @passageiro = current_user.passageiro

   render json: @passageiro

 end

 # GET /api/v1/passageiro/1

 def show

   render json: @passageiro

 end

 # POST /api/v1/passageiro

 def create

   @passageiro = Passageiro.new(passageiro_params.merge(user: current_user))

   if @passageiro.save

     render json: @passageiro, status: :created

   else

     render json: @passageiro.errors, status: :unprocessable_entity

   end

 end

 # PATCH/PUT /api/v1/passageiro/1

 def update

   if @passageiro.update(passageiro_params)

     render json: @passageiro

   else

     render json: @passageiro.errors, status: :unprocessable_entity

   end

 end

 # DELETE /api/v1/passageiro/1

 def destroy

   @passageiro.destroy

 end

 private

   # Use callbacks to share common setup or constraints between actions.

   def set_passageiro

     @passageiro = Passageiro.find(params[:id])

   end

   # Only allow a trusted parameter "white list" through.

   def passageiro_params

     params.require(:passageiro).permit(:nome_completo, :cpf, :cod_reserva, :voo_id)

   end

   def require_authorization!

     unless current_user == @passageiro.user

       render json: {}, status: :forbidden

     end

   end

end
