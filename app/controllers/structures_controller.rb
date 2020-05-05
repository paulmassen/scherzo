class StructuresController < ApplicationController
  before_action :set_structure, only: [:show, :edit, :update, :destroy]

  # GET /structures
  # GET /structures.json
  def index
    @structures = Structure.all
  end

  # GET /structures/1
  # GET /structures/1.json
  def show
    @futursengagements  = @structure.engagements.all.where("begin >= ?", Date.today).where("status == ?", "confirmed")
    @pastengagements    = @structure.engagements.all.where("end <= ?", Date.today).where("status == ?", "confirmed")
    @pendinginvitations = @structure.engagements.all.where("status == ?", "invitation")
    @optionengagements  = @structure.engagements.all.where("status == ?", "option")
  end

  # GET /structures/new
  def new
    @structure = Structure.new
  end

  # GET /structures/1/edit
  def edit
  end

  # POST /structures
  # POST /structures.json
  def create
    @structure = Structure.new(structure_params)

    respond_to do |format|
      if @structure.save
        format.html { redirect_to @structure, notice: 'Structure was successfully created.' }
        format.json { render :show, status: :created, location: @structure }
      else
        format.html { render :new }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structures/1
  # PATCH/PUT /structures/1.json
  def update
    respond_to do |format|
      if @structure.update(structure_params)
        format.html { redirect_to @structure, notice: 'Structure was successfully updated.' }
        format.json { render :show, status: :ok, location: @structure }
      else
        format.html { render :edit }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structures/1
  # DELETE /structures/1.json
  def destroy
    @structure.destroy
    respond_to do |format|
      format.html { redirect_to structures_url, notice: 'Structure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def search
      render json: Structure.all.typeahead_search(params[:title])
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure
      @structure = Structure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def structure_params
      params.require(:structure).permit(:title, :address)
    end

end
