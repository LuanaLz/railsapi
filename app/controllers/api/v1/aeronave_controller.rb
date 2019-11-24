class Api::V1::AeronaveController < Api::V1::ApiController

 before_action :set_aeronave, only: [:show, :update, :destroy]

 before_action :require_authorization!, only: [:show, :update, :destroy]

 # GET /api/v1/contacts

 def index

   @aeronave = current_user.aeronave

   render json: @aeronave

 end

 # GET /api/v1/aeronave/1

 def show

   render json: @aeronave

 end

 # POST /api/v1/aeronave

 def create

   @aeronave = Aeronave.new(contact_params.merge(user: current_user))

   if @aeronave.save

     render json: @aeronave, status: :created

   else

     render json: @aeronave.errors, status: :unprocessable_entity

   end

 end

 # PATCH/PUT /api/v1/aeronave/1

 def update

   if @aeronave.update(aeronave_params)

     render json: @aeronave

   else

     render json: @aeronave.errors, status: :unprocessable_entity

   end

 end

 # DELETE /api/v1/aeronave/1

 def destroy

   @aeronave.destroy

 end

 private

   # Use callbacks to share common setup or constraints between actions.

   def set_aeronave

     @aeronave = Aeronave.find(params[:id])

   end

   # Only allow a trusted parameter "white list" through.

   def aeronave_params

     params.require(:aeronave).permit(:modelo, :capacidade, :prefixo)

   end

   def require_authorization!

     unless current_user == @aeronave.user

       render json: {}, status: :forbidden

     end

   end

end
