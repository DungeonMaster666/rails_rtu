class BazesprodsController < ApplicationController
  before_action :set_bazesprod, only: %i[ show edit update destroy product]
  before_action :admin_user, only: [:edit, :destroy, :new, :update]
  def index
    @bazesprods = Bazesprod.order("prodnos ASC").page(params[:page])
  end


  def product
    @last_page = params[:page]
  end

  def new
    @bazesprod = Bazesprod.new
  end

  def edit
  end

  def create
    @bazesprod = Bazesprod.new(bazesprod_params)
    respond_to do |format|
      if @bazesprod.save
        format.html { redirect_to bazesprods_url, notice: "Bāzes produkts ir veiksmīgi saglabāts." }
        format.json { render :product, status: :created, location: @bazesprod }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bazesprod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bazesprods/1 or /bazesprods/1.json
  def update
    respond_to do |format|
      if @bazesprod.update(bazesprod_params)
        format.html { redirect_to bazesprods_url, notice: "Bāzes produkts ir veiksmīgi atjaunināts." }
        format.json { render :product, status: :ok, location: @bazesprod }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bazesprod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bazesprods/1 or /bazesprods/1.json
  def destroy
    @bazesprod.destroy
    respond_to do |format|
      format.html { redirect_to bazesprods_url, notice: "Bāzes produkts ir veiksmīgi dzēsts." }
      format.json { head :no_content }
    end
  end

  def admin_user
    if !current_user.admin?
      redirect_to(bazesprods_path, notice: "Nav tiesību izpildīt darbību!")
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bazesprod
      @bazesprod = Bazesprod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bazesprod_params
      params.require(:bazesprod).permit(:prodnos, :olb, :tauki, :oglh, :kcal, :A, :B1, :B2, :C, :Ca, :P, :Fe, :cena, :min, :max)
    end
end
