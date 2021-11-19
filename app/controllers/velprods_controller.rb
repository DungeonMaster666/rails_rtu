class VelprodsController < ApplicationController
  before_action :set_velprod, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /velprods or /velprods.json
  def index
    @velprods = Velprod.all
    @baze = Bazesprod.order('prodnos ASC').all
    @bazesprodsaraksts = Bazesprod.order('prodnos ASC').all.map { |prod| [prod.prodnos, prod.nutrition1] }
    @bazesprodsaraksts = @bazesprodsaraksts.unshift("")

  end

  # GET /velprods/1 or /velprods/1.json
  def show
  end

  # GET /velprods/new
  def new
    @velprod = current_user.velprods.build
  end

  # GET /velprods/1/edit
  def edit
  end

  # POST /velprods or /velprods.json
  def create
    @velprod = current_user.velprods.build(velprod_params)

    respond_to do |format|
      if @velprod.save
        format.html { redirect_to @velprod, notice: "Velprod was successfully created." }
        format.json { render :show, status: :created, location: @velprod }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @velprod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /velprods/1 or /velprods/1.json
  def update
    respond_to do |format|
      if @velprod.update(velprod_params)
        format.html { redirect_to @velprod, notice: "Velprod was successfully updated." }
        format.json { render :show, status: :ok, location: @velprod }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @velprod.errors, status: :unprocessable_entity }
      end
    end
  end

  def test
    if params[:tocopy] != "" and params[:tocopy].to_i != 0  #defense from sql injection
      if !Bazesprod.exists?(params[:tocopy])
        redirect_to velprods_path, notice: "Jāievada eksistējošo produktu"
      else
        if Velprod.exists?(prod_nos: Bazesprod.where(id: params[:tocopy]).first.prodnos)
          redirect_to velprods_path, notice: "Izvēlētais produkts jau ir pievienots"
        else
          @selectedprod = Bazesprod.where(id: params[:tocopy]).first
          Velprod.create({:user_id => current_user.id, :prod_nos => @selectedprod.prodnos, :nutrition1 => @selectedprod.nutrition1})
          redirect_to velprods_path
        end
      end
    else
      redirect_to velprods_path, notice: "Jāizvēlās produktu"
    end
  end

  # DELETE /velprods/1 or /velprods/1.json
  def destroy
    @velprod.destroy
    respond_to do |format|
      format.html { redirect_to velprods_url, notice: "Velprod was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @nevelprod = current_user.velprods.find_by(id: params[:id])
    redirect_to velprods_path, notice: "Nav tiesību rediģēt" if @velprod.nil?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_velprod
      @velprod = Velprod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def velprod_params
      params.require(:velprod).permit(:user_id, :prod_nos, :nutrition1)
    end
end
