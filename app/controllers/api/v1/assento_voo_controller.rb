class Api::V1::AssentoVooController < ApplicationController

 before_action :set_assento_voo, only: [:show, :update, :destroy]

 before_action :require_authorization!, only: [:show, :update, :destroy]

 # GET /api/v1/contacts

 def index

   @assento_voo = current_user.assento_voo

   render json: @assento_voo

 end

 # GET /api/v1/assento_voo/1

 def show

   render json: @assento_voo

 end

 # POST /api/v1/assento_voo

 def create

   @assento_voo = AssentoVoo.new(contact_params.merge(user: current_user))

   if @assento_voo.save

     render json: @assento_voo, status: :created

   else

     render json: @assento_voo.errors, status: :unprocessable_entity

   end

 end

 # PATCH/PUT /api/v1/assento_voo/1

 def update

   if @assento_voo.update(assento_voo_params)

     render json: @assento_voo

   else

     render json: @assento_voo.errors, status: :unprocessable_entity

   end

 end

 # DELETE /api/v1/assento_voo/1

 def destroy

   @assento_voo.destroy

 end

 private

   # Use callbacks to share common setup or constraints between actions.

   def set_assento_voo

     @assento_voo = AssentoVoo.find(params[:id])

   end

   # Only allow a trusted parameter "white list" through.

   def assento_voo_params

     params.require(:assento_voo).permit(:voo_id, :assento_id, :passageiro_id)

   end

   def require_authorization!

     unless current_user == @assento_voo.user

       render json: {}, status: :forbidden

     end

   end

end
