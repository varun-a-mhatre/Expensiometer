class PresentsController < ApplicationController
  # GET /presents
  # GET /presents.xml
  def index
    @presents = Present.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @presents }
    end
  end

  # GET /presents/1
  # GET /presents/1.xml
  def show
    @present = Present.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @present }
    end
  end

  # GET /presents/new
  # GET /presents/new.xml
  def new
    
    
    @itemid = params[:id]
    @products = Product.find_by_id(params[:prod_id]) 
    @present = Present.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @present }
    end
  end




  # POST /presents
  # POST /presents.xml



  def create
    @present = Present.new(params[:present])
    
    respond_to do |format|
      if @present.save
        format.html { redirect_to(@present, :notice => 'Present was successfully created.') }
        format.xml  { render :xml => @present, :status => :created, :location => @present }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @present.errors, :status => :unprocessable_entity }
      end
    end
  end


  # GET /presents/1/edit
  def edit
    @present = Present.find(params[:id])
   

    respond_to do |format|
	 format.js 
    end	

  end



  # PUT /presents/1
  # PUT /presents/1.xml
  #  Will actually create a new record for each updated present
  def update
      


      @present = Present.new(params[:present])
      @present.item_id = params[:present_item_id]
 
    respond_to do |format|
      if @present.save
       # format.html { redirect_to(@present, :notice => 'Present was successfully created.') }
        #format.xml  { render :xml => @present, :status => :created, :location => @present }
	format.html  { redirect_to (items_path) }
    else
        format.html { render :action => "new" }
        format.xml  { render :xml => @present.errors, :status => :unprocessable_entity }
      end
    end


    #@present = Present.find(params[:id])

    #respond_to do |format|
    #  if @present.update_attributes(params[:present])
     #   format.html { redirect_to(@present, :notice => 'Present was successfully updated.') }
      #  format.xml  { head :ok }
     # else
      #  format.html { render :action => "edit" }
      #  format.xml  { render :xml => @present.errors, :status => :unprocessable_entity }
     # end
   # end

  end

  # DELETE /presents/1
  # DELETE /presents/1.xml
  def destroy
    @present = Present.find(params[:id])
    @present.destroy

    respond_to do |format|
      format.html { redirect_to(presents_url) }
      format.xml  { head :ok }
    end
  end
end
