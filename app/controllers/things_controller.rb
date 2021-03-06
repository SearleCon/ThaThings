class ThingsController < ApplicationController
 helper_method :sort_column, :sort_direction  
  
  # GET /things
  # GET /things.json
  def index
    # @things = Thing.all
    
    @setting = Setting.find(:all, :conditions => ["user_id=?", current_user.id])

    @things = Thing.paginate :include => :notes, :conditions => ["user_id=?", current_user.id], 
                             :page => params[:page], :per_page => @setting.first.rowcountperpage, :order => ('archive, ' + sort_column + ' ' + sort_direction) # :order => 'updated_at DESC'  
                             
    @things = @things.search(params[:search]) # SHAUN SEARCH

      

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @things }
      format.mobile
    end
  end

  # GET /things/1
  # GET /things/1.json
  def show
    @thing = Thing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thing }
    end
  end

  # GET /things/new
  # GET /things/new.json
  def new
    @thing = Thing.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thing }
    end
  end

  # GET /things/1/edit
  def edit
    @thing = Thing.find(params[:id])
  end

  # POST /things
  # POST /things.json
  def create
    @thing = Thing.new(params[:thing])
    @thing.user_id = current_user.id    
    

    respond_to do |format|
      if @thing.save
        format.html { redirect_to things_path, notice: 'Your thing was successfully created!' }
        format.json { render json: @thing, status: :created, location: @thing }
      else
        format.html { render action: "new" }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /things/1
  # PUT /things/1.json
  def update
    @thing = Thing.find(params[:id])

    respond_to do |format|
      if @thing.update_attributes(params[:thing])
        format.html { redirect_to things_path, notice: 'Your thing was successfully updated!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy

    respond_to do |format|
      format.html { redirect_to things_url }
      format.json { head :no_content }
    end
  end
  
  
  private
  def sort_column
    Thing.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"    
  end
  
  
end
