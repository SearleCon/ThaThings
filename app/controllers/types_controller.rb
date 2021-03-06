class TypesController < ApplicationController
  # GET /types
  # GET /types.json
  helper_method :sort_column, :sort_direction

  def index
    @setting = Setting.find(:all, :conditions => ["user_id=?", current_user.id])
    
    @types = Type.paginate :conditions => ["user_id=?", current_user.id], :page => params[:page], :per_page => @setting.first.rowcountperpage, :order => (sort_column + ' ' + sort_direction) #'updated_at DESC'
#    @types = Type.order(sort_column + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end

  # GET /types/1
  # GET /types/1.json
  def show
    @type = Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type }
    end
  end

  # GET /types/new
  # GET /types/new.json
  def new
    @type = Type.new    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type }
    end
  end

  # GET /types/1/edit
  def edit
    @type = Type.find(params[:id])
  end

  # POST /types
  # POST /types.json
  def create
    @type = Type.new(params[:type])
    @type.user_id = current_user.id

    respond_to do |format|
      if @type.save
        format.html { redirect_to @type, notice: 'You successfully added your new type!' }
        format.json { render json: @type, status: :created, location: @type }
      else
        format.html { render action: "new" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /types/1
  # PUT /types/1.json
  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to @type, notice: 'Type was successfully updated!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to types_url }
      format.json { head :no_content }
    end
  end
    
  private
  def sort_column
    Type.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"    
  end

end
