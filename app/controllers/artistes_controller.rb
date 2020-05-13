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
    @futursengagements  = Engagement.all.where("artiste_id = ?", params[:id]).where("startengagement >= ?", Date.today).where("status = ?", "confirmed")
    @pastengagements    = Engagement.all.where("artiste_id = ?", params[:id]).where("endengagement <= ?", Date.today).where("status = ?", "confirmed")
    @pendinginvitations = Engagement.all.where("artiste_id = ?", params[:id]).where("status = ?", "invitation")
    @optionengagements  = Engagement.all.where("artiste_id = ?", params[:id]).where("status = ?", "option")
    #@futursengagements = Engagement.where(:begin.to_date.future?)
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
        format.html { redirect_back fallback_location: index, notice: 'Artiste was successfully updated.' }
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
  
  def printfiche
    @artiste = Artiste.find(params[:id])
    report = ODFReport::Report.new("/home/ubuntu/environment/myform/app/templates/fichederenseignements.odt") do |r|
      r.add_field(:artiste, @artiste.name)
      r.add_field(:datedenaissance, @artiste.birthdate)
      r.add_field(:naissancecity, @artiste.birthplacecity)
      r.add_field(:naissancepays, @artiste.birthplacecountry)
      r.add_field(:nationalite, @artiste.nationality)
      r.add_field(:familystatus, @artiste.familystatus)
      r.add_field(:secu, @artiste.socialsecurity)
      r.add_field(:congesspectacles, @artiste.congesspectacles)
      r.add_field(:passportnumber, @artiste.passportnumber)
      r.add_field(:audiens, @artiste.audiens)

    end
    
    send_data report.generate,
      type: 'application/vnd.oasis.opendocument.text',
      disposition: 'attachment',
      filename: 'fichederenseignements.odt'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artiste
      @artiste = Artiste.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artiste_params
      params.require(:artiste).permit(:name, :address, :birthdate, :passportnumber, :passportdelivered, :passportexpire, :color, :image, :birthplacecity, :birthplacedepartment, :birthplacecountry, :nationality, :familystatus, :maidenname, :socialsecurity, :instrument, :congesspectacles, :audiens, :biography)
    end
end
