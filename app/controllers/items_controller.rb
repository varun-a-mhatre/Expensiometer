class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  def index
    @categories = Category.order("name")
    @products = Product.order("name")
    @item = Item.new
    present = @item.presents.build


    sqltext1= "SELECT SUM(i.quantity) AS quantity, SUM(p.quantity_left) quantleft, SUM(i.price) as price,  SUM((pd.calories_per_unit*i.quantity)-(pd.calories_per_unit*p.quantity_left)) AS eaten, (WEEK(p.created_at,5)-WEEK(DATE_SUB(p.created_at, INTERVAL DAYOFMONTH(p.created_at)-1 DAY),5)+1) as weekk, MONTH(p.created_at) as monthh,    CONCAT((WEEK(p.created_at,5)-WEEK(DATE_SUB(p.created_at, INTERVAL DAYOFMONTH(p.created_at)-1 DAY),5)+1),'/',MONTH(p.created_at)) AS monthweek FROM items i INNER JOIN (SELECT  id, item_id, MAX(created_at) MaxDate FROM presents GROUP BY item_id) MaxDates ON i.id = MaxDates.item_id INNER JOIN presents p ON   MaxDates.item_id = p.item_id AND MaxDates.MaxDate = p.created_at INNER JOIN products pd ON i.product_id = pd.id group by monthh ,weekk order by monthh Asc, weekk Asc limit 5;"
    
    @expenses = Item.find_by_sql(sqltext1)



    @items = Item.all
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @items }
    end
  end


  def update_products
    # updates songs based on artist selected
    category = Category.find(params[:category_id])
    products  = category.products

    render :update do |page|
      page.replace_html 'products', :partial => 'products', :object => products
    end
  end



  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @categories = Category.order("name")
    @item = Item.new
    present = @item.presents.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end



  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html {redirect_to items_path}
        format.js
	
      else
        format.html { redirect_to items_path}
        format.js
      end
    end
  end

	def blankk

		@item = Item.all

	end


  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(@item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end



  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_path }
      format.js
    end
  end



end



