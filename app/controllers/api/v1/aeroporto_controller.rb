class Api::V1::AeroportoController < ApplicationController

 before_action :set_aeroporto, only: [:show, :update, :destroy]

 before_action :require_authorization!, only: [:show, :update, :destroy]

 # GET /api/v1/aeroporto

 def index

   @aeroporto = current_user.aeroporto

   render json: @aeroporto

 end

 # GET /api/v1/aeroporto/1

 def show

   render json: @aeroporto

 end

 # POST /api/v1/aeroporto

 def create

   @aeroporto = Aeroporto.new(aeroporto_params.merge(user: current_user))

   if @aeroporto.save

     render json: @aeroporto, status: :created

   else

     render json: @aeroporto.errors, status: :unprocessable_entity

   end

 end

 # PATCH/PUT /api/v1/aeroporto/1

 def update

   if @aeroporto.update(aeroporto_params)

     render json: @aeroporto

   else

     render json: @aeroporto.errors, status: :unprocessable_entity

   end

 end

 # DELETE /api/v1/aeroporto/1

 def destroy

   @aeroporto.destroy

 end

 private

   # Use callbacks to share common setup or constraints between actions.

   def set_aeroporto

     @aeroporto = Aeroporto.find(params[:id])

   end

   # Only allow a trusted parameter "white list" through.

   def aeroporto_params

     params.require(:aeroporto).permit(:name, :sigla, :cidade)

   end

   def require_authorization!

     unless current_user == @aeroporto.user

       render json: {}, status: :forbidden

     end

   end

end
