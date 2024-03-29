class StructuresController < ApplicationController
  before_action :set_structure, only: [:show, :edit, :update, :destroy]

  # GET /structures
  # GET /structures.json
  def index
    @pagy, @structures = pagy(Structure.all)
    
  end

  # GET /structures/1
  # GET /structures/1.json
  def show
    @contacts = Contact.all
    @futursengagements  = @structure.engagements.all.where("startengagement > ?", Date.today.beginning_of_day).where("status = ?", "confirmed")
    @pastengagements    = @structure.engagements.all.where("endengagement < ?", Date.today.beginning_of_day).where("status = ?", "confirmed")
    @pendinginvitations = @structure.engagements.all.where("status = ?", "invitation")
    @optionengagements  = @structure.engagements.all.where("status = ?", "option")
  end

  # GET /structures/new
  def new
    @structure = Structure.new
  end

  # GET /structures/1/edit
  def edit
  end
  def search
    if params[:title]
      @structures = Structure.search_by_title(params[:title])
    else
      @structures = Structure.all
    end
    render '/structures/search.json'
    #render json: @structures
  end
  # POST /structures
  # POST /structures.json
  def create
    @structure = Structure.new(structure_params)

    respond_to do |format|
      if @structure.save
        format.html { redirect_back fallback_location: index, notice: 'Structure was successfully created.' }
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
        format.html { redirect_back fallback_location: index, notice: 'Structure was successfully updated.' }
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
