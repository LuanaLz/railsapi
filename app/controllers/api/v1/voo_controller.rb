class Api::V1::VooController < ApplicationController
 before_action :set_voo, only: [:show, :update, :destroy]

 before_action :require_authorization!, only: [:show, :update, :destroy]

 # GET /api/v1/voo

 def index

   @voo = current_user.voo

   render json: @voo

 end

 # GET /api/v1/voo/1

 def show

   render json: @voo

 end

 # POST /api/v1/voo

 def create

   @voo = Voo.new(voo_params.merge(user: current_user))

   if @voo.save

     render json: @voo, status: :created

   else

     render json: @voo.errors, status: :unprocessable_entity

   end

 end

 # PATCH/PUT /api/v1/voo/1

 def update

   if @voo.update(voo_params)

     render json: @voo

   else

     render json: @voo.errors, status: :unprocessable_entity

   end

 end

 # DELETE /api/v1/voo/1

 def destroy

   @voo.destroy

 end

 private

   # Use callbacks to share common setup or constraints between actions.

   def set_voo

     @voo = Voo.find(params[:id])

   end

   # Only allow a trusted parameter "white list" through.

   def voo_params

     params.require(:voo).permit(:numero, :qtd_escalas, :origem, :destino, :data_saida, :aeronave_id)

   end

   def require_authorization!

     unless current_user == @voo.user

       render json: {}, status: :forbidden

     end

   end

end
