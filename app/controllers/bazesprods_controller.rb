class BazesprodsController < ApplicationController
  before_action :set_bazesprod, only: %i[ show edit update destroy ]
  before_action :admin_user, only: [:edit, :destroy, :new, :update]
  # GET /bazesprods or /bazesprods.json
  def index
    @bazesprods = Bazesprod.all
  end

  # GET /bazesprods/1 or /bazesprods/1.json
  def show
  end

  # GET /bazesprods/new
  def new
    @bazesprod = Bazesprod.new
  end

  # GET /bazesprods/1/edit
  def edit
  end

  # POST /bazesprods or /bazesprods.json
  def create
    @bazesprod = Bazesprod.new(bazesprod_params)

    respond_to do |format|
      if @bazesprod.save
        format.html { redirect_to @bazesprod, notice: "Bazesprod was successfully created." }
        format.json { render :show, status: :created, location: @bazesprod }
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
        format.html { redirect_to @bazesprod, notice: "Bazesprod was successfully updated." }
        format.json { render :show, status: :ok, location: @bazesprod }
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
      format.html { redirect_to bazesprods_url, notice: "Bazesprod was successfully destroyed." }
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
      params.require(:bazesprod).permit(:prodnos, :nutrition1)
    end
end
