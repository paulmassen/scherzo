class ArtistesController < ApplicationController
  before_action :set_artiste, only: [:show, :edit, :update, :destroy]

  # GET /artistes
  # GET /artistes.json
  def index
    @artistes = Artiste.all
    @engagements = Engagement.all
    #@artistesengagements = Engagement.find(2)
   
  end

  # GET /artistes/1
  # GET /artistes/1.json
  def show
    @engagements = Engagement.all
  end
  
  #def ficheinfo
  # @artiste = Artiste.find(params[:id])
  #end

  # GET /artistes/new
  def new
    @artiste = Artiste.new
  end

  # GET /artistes/1/edit
  def edit
  end

  # POST /artistes
  # POST /artistes.json
  def create
    @artiste = Artiste.new(artiste_params)

    respond_to do |format|
      if @artiste.save
        format.html { redirect_to action: 'index', notice: 'Artiste was successfully created.' }
        format.json { render :show, status: :created, location: @artiste }
      else
        format.html { render :new }
        format.json { render json: @artiste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artistes/1
  # PATCH/PUT /artistes/1.json
  def update
    respond_to do |format|
      if @artiste.update(artiste_params)
        format.html { redirect_to action: 'index', notice: 'Artiste was successfully updated.' }
        format.json { render :show, status: :ok, location: @artiste }
      else
        format.html { render :edit }
        format.json { render json: @artiste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artistes/1
  # DELETE /artistes/1.json
  def destroy
    @artiste.destroy
    respond_to do |format|
      format.html { redirect_to artistes_url, notice: 'Artiste was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artiste
      @artiste = Artiste.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artiste_params
      params.require(:artiste).permit(:name, :address, :birthdate, :passportnumber, :passportdelivered, :passportexpire, :color, :image)
    end
end
