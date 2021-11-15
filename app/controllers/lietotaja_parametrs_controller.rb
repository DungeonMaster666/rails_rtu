class LietotajaParametrsController < ApplicationController
  before_action :set_lietotaja_parametr, only: %i[ show edit update destroy ]

  # GET /lietotaja_parametrs or /lietotaja_parametrs.json
  def index
    @lietotaja_parametrs = LietotajaParametr.all
  end

  # GET /lietotaja_parametrs/1 or /lietotaja_parametrs/1.json
  def show
  end

  # GET /lietotaja_parametrs/new
  def new
    @lietotaja_parametr = LietotajaParametr.new
  end

  # GET /lietotaja_parametrs/1/edit
  def edit
  end

  # POST /lietotaja_parametrs or /lietotaja_parametrs.json
  def create
    @lietotaja_parametr = LietotajaParametr.new(lietotaja_parametr_params)

    respond_to do |format|
      if @lietotaja_parametr.save
        format.html { redirect_to @lietotaja_parametr, notice: "Lietotaja parametr was successfully created." }
        format.json { render :show, status: :created, location: @lietotaja_parametr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lietotaja_parametr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lietotaja_parametrs/1 or /lietotaja_parametrs/1.json
  def update
    respond_to do |format|
      if @lietotaja_parametr.update(lietotaja_parametr_params)
        format.html { redirect_to @lietotaja_parametr, notice: "Lietotaja parametr was successfully updated." }
        format.json { render :show, status: :ok, location: @lietotaja_parametr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lietotaja_parametr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lietotaja_parametrs/1 or /lietotaja_parametrs/1.json
  def destroy
    @lietotaja_parametr.destroy
    respond_to do |format|
      format.html { redirect_to lietotaja_parametrs_url, notice: "Lietotaja parametr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lietotaja_parametr
      @lietotaja_parametr = LietotajaParametr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lietotaja_parametr_params
      params.require(:lietotaja_parametr).permit(:svars, :augums, :vecums, :dzimums, :user_id)
    end
end
