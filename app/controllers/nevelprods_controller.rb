class NevelprodsController < ApplicationController
  before_action :set_nevelprod, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /nevelprods or /nevelprods.json
  def index
    @nevelprods = Nevelprod.all
  end

  # GET /nevelprods/1 or /nevelprods/1.json
  def show
  end

  # GET /nevelprods/new
  def new
    @nevelprod = current_user.nevelprods.build
  end

  # GET /nevelprods/1/edit
  def edit
  end

  # POST /nevelprods or /nevelprods.json
  def create
    @nevelprod = current_user.nevelprods.build(nevelprod_params)

    respond_to do |format|
      if @nevelprod.save
        format.html { redirect_to @nevelprod, notice: "Nevelprod was successfully created." }
        format.json { render :show, status: :created, location: @nevelprod }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nevelprod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nevelprods/1 or /nevelprods/1.json
  def update
    respond_to do |format|
      if @nevelprod.update(nevelprod_params)
        format.html { redirect_to @nevelprod, notice: "Nevelprod was successfully updated." }
        format.json { render :show, status: :ok, location: @nevelprod }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nevelprod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nevelprods/1 or /nevelprods/1.json
  def destroy
    @nevelprod.destroy
    respond_to do |format|
      format.html { redirect_to nevelprods_url, notice: "Nevelprod was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @nevelprod = current_user.nevelprods.find_by(id: params[:id])
    redirect_to nevelprods_path, notice: "Nav tiesību rediģēt" if @nevelprod.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nevelprod
      @nevelprod = Nevelprod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nevelprod_params
      params.require(:nevelprod).permit(:user_id, :prod_nos)
    end
end
