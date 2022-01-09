class LietotajaparametrsController < ApplicationController
  before_action :set_lietotajaparametr, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  # GET /lietotajaparametrs or /lietotajaparametrs.json
  def index
    @lietotajaparametrs = Lietotajaparametr.all

  end

  # GET /lietotajaparametrs/1 or /lietotajaparametrs/1.json
  def show
  end

  # GET /lietotajaparametrs/new
  def new
    @type = "new"
    if Lietotajaparametr.exists?(user_id: current_user.id)
      redirect_to lietotajaparametrs_path, notice: "Nav piekļuves"
    else
      @lietotajaparametr = current_user.lietotajaparametrs.build
    end
  end

  # GET /lietotajaparametrs/1/edit
  def edit
    @type = "edit"

  end

  # POST /lietotajaparametrs or /lietotajaparametrs.json
  def create
    @lietotajaparametr = current_user.lietotajaparametrs.build(lietotajaparametr_params)

    
    respond_to do |format|
      if @lietotajaparametr.save
        format.html { redirect_to lietotajaparametrs_url, notice: "Jūsu parametri ir veiksmīgi saglabāti." }
        format.json { render :show, status: :created, location: @lietotajaparametr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lietotajaparametr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lietotajaparametrs/1 or /lietotajaparametrs/1.json
  def update
    respond_to do |format|
      if @lietotajaparametr.update(lietotajaparametr_params)
        format.html { redirect_to lietotajaparametrs_url, notice: "Jūsu parametri ir veiksmīgi atjaunināti." }
        format.json { render :show, status: :ok, location: @lietotajaparametr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lietotajaparametr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lietotajaparametrs/1 or /lietotajaparametrs/1.json
  def destroy
    @lietotajaparametr.destroy
    respond_to do |format|
      format.html { redirect_to lietotajaparametrs_url, notice: "Jūsu parametri ir veiksmīgi dzēsti." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @lietotajaparametr = current_user.lietotajaparametrs.find_by(id: params[:id])
    redirect_to lietotajaparametrs_path, notice: "Nav tiesību rediģēt" if @lietotajaparametr.nil?
  end

  def activatepython

    edienkarte = Edienkarte.where(user_id: current_user.id).all
    unless edienkarte.nil?
      edienkarte.delete_all
    end
    Dir.chdir(Rails.root)
    system "python3 lib/assets/Dieta2.py '#{current_user.id}' "
    @edienkartes = edienkarte
    @average_price = average_price(edienkarte)
  end

  def average_price(edienkarte)
    bazesprods = Bazesprod.all
    average_price = 0
    edienkarte.each do |product|
      if bazesprods.exists?(prodnos: product.prodnos)
        full_price = bazesprods.where(prodnos: product.prodnos).first&.cena.to_f
        average_prod_price = full_price / 100 * product.quantity.to_i
        average_price += average_prod_price

      else
        full_price = product.cena.to_f
        average_price += full_price
      end
    end
    average_price.round(2)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lietotajaparametr
      @lietotajaparametr = Lietotajaparametr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lietotajaparametr_params
      params.require(:lietotajaparametr).permit(:svars, :augums, :vecums, :dzimums, :user_id, :koef, :goal)
    end
end
