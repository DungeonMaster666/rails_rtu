class EdienkartesController < ApplicationController
  before_action :set_edienkarte, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]
  # GET /edienkartes or /edienkartes.json
  def index
    @edienkartes = Edienkarte.all
  end

  # GET /edienkartes/1 or /edienkartes/1.json
  def show
  end

  # GET /edienkartes/new
  def new
    @edienkarte = Edienkarte.new
  end

  # GET /edienkartes/1/edit
  def edit
  end

  # POST /edienkartes or /edienkartes.json
  def create
    @edienkarte = Edienkarte.new(edienkarte_params)

    respond_to do |format|
      if @edienkarte.save
        format.html { redirect_to @edienkarte, notice: "Edienkarte was successfully created." }
        format.json { render :show, status: :created, location: @edienkarte }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @edienkarte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edienkartes/1 or /edienkartes/1.json
  def update
    respond_to do |format|
      if @edienkarte.update(edienkarte_params)
        format.html { redirect_to @edienkarte, notice: "Edienkarte was successfully updated." }
        format.json { render :show, status: :ok, location: @edienkarte }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @edienkarte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edienkartes/1 or /edienkartes/1.json
  def destroy
    @edienkarte.destroy
    respond_to do |format|
      format.html { redirect_to edienkartes_url, notice: "Edienkarte was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  def correct_user
    @edienkarte = current_user.edienkartes.find_by(id: params[:id])
    redirect_to edienkartes_path, notice: "Nav tiesību rediģēt" if @edienkarte.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edienkarte
      @edienkarte = Edienkarte.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def edienkarte_params
      params.require(:edienkarte).permit(:user_id, :prodnos, :nutrition1, :shopnos, :cena, :linktophoto, :quantity)
    end
end
