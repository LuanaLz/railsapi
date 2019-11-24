class Api::V1::AssentoController < ApplicationController

 before_action :set_assento, only: [:show, :update, :destroy]

 before_action :require_authorization!, only: [:show, :update, :destroy]

 # GET /api/v1/assento

 def index

   @assento = current_user.assento

   render json: @assento

 end

 # GET /api/v1/assento/1

 def show

   render json: @assento

 end

 # POST /api/v1/contacts

 def create

   @assento = Assento.new(assento_params.merge(user: current_user))

   if @assento.save

     render json: @assento, status: :created

   else

     render json: @assento.errors, status: :unprocessable_entity

   end

 end

 # PATCH/PUT /api/v1/assento/1

 def update

   if @assento.update(assento_params)

     render json: @assento

   else

     render json: @assento.errors, status: :unprocessable_entity

   end

 end

 # DELETE /api/v1/assento/1

 def destroy

   @assento.destroy

 end

 private

   # Use callbacks to share common setup or constraints between actions.

   def set_assento

     @assento = Assento.find(params[:id])

   end

   # Only allow a trusted parameter "white list" through.

   def assento_params

     params.require(:assento).permit(:cod_assento, :aeronave_id)

   end

   def require_authorization!

     unless current_user == @assento.user

       render json: {}, status: :forbidden

     end

   end

end
