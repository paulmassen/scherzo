class EngagementsController < ApplicationController
  before_action :set_engagement, only: [:show, :edit, :update, :destroy]

  # GET /engagements
  # Test commentaire
  # GET /engagements.json
  def index
    @engagements = Engagement.order(params[:sort])
   # @artiste = Artiste.find(engagement_params[:artiste_id])
    @artistes = Artiste.all
    
  end
  
  def print
    @engagement = Engagement.find(params[:id])
    report = ODFReport::Report.new("/home/ubuntu/environment/myform/app/templates/feuillederoute.odt") do |r|
      
      r.add_field(:engagement_title, @engagement.title)
      r.add_field(:engagement_artiste, @engagement.artiste.name)
      
      r.add_table('PLANNING_TABLE', @engagement.events, :header=>true) do |t|
        t.add_column(:date){|event| event.eventdate || "Empty"}
        t.add_column(:type){|event| event.eventtype || "Empty"}
        t.add_column(:debut){|event| event.eventbegin.strftime("%k:%M") || "Empty"}
        t.add_column(:fin){|event| event.eventend.strftime("%k:%M") || "Empty"}
        t.add_column(:desc1){|event| event.description1 || "Empty"}
        t.add_column(:desc2){|event| event.description2 || "Empty"}
        t.add_column(:location){|event| event.location || "Empty"}
      end
    end
    
    send_data report.generate,
        type: 'application/vnd.oasis.opendocument.text',
      disposition: 'attachment',
      filename: 'report.odt'
  end

  # GET /engagements/1
  # GET /engagements/1.json
  def show
  end

  # GET /engagements/new
  def new
    @engagement = Engagement.new
  end

  # GET /engagements/1/edit
  def edit
  end

  # POST /engagements
  # POST /engagements.json
  def create
    @engagement = Engagement.new(engagement_params)

    respond_to do |format|
      if @engagement.save
        format.html { redirect_back fallback_location: index, notice: 'Engagement was successfully created.' }
        format.json { render :show, status: :created, location: @engagement }
      else
        format.html { render :new }
        format.json { render json: @engagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engagements/1
  # PATCH/PUT /engagements/1.json
  def update
    respond_to do |format|
      if @engagement.update(engagement_params)
        format.html { redirect_to action: 'index', notice: 'Engagement was successfully updated.' }
        format.json { render :show, status: :ok, location: @engagement }
      else
        format.html { render :edit }
        format.json { render json: @engagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engagements/1
  # DELETE /engagements/1.json
  def destroy
    @engagement.destroy
    respond_to do |format|
      format.html { redirect_to engagements_url, notice: 'Engagement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engagement
      @engagement = Engagement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def engagement_params
      params.require(:engagement).permit(:title, :status, :category, :begin, :end, :contract, :hotel, :voyages, :taxi, :sent, :rehearsals, :artiste_id, :programme_id, programmes_attributes: [:id, :title], events_attributes: [:id, :eventtype, :eventdate, :eventbegin, :eventend, :description1, :description2, :location, :_destroy], artistes_attributes: [:id, :name, :color])
    end
end
