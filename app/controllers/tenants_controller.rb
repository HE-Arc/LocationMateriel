class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]

  # GET /tenants
  # GET /tenants.json
  def index
    @tenants = Tenant.all
  end

  # GET /tenants/1
  # GET /tenants/1.json
  def show
  end

  # GET /tenants/new
  def new
    @product = Product.new
    if params[:id] != nil
      @product = Product.find(params[:id])
    end
    
    @tenant = Tenant.new

    tenantsExitIds = Tenant.where(product: @product).where.not(confirm_location: 2)
    @tenantExisting = Tenant.where(id: tenantsExitIds)

    @events = []
    @events << {:id => @product.id, :title => "Début", :start => "#{@product.date_start}",:end => "#{@product.date_start+1}" }
    @events << {:id => @product.id, :title => "Fin", :start => "#{@product.date_end}",:end => "#{@product.date_end+1}" }

    @tenantExisting.each do |t|
      @events << {:id => t.id, :title => "Loué", :start => "#{t.date_start}",:end => "#{t.date_end+1}" }
    end

    respond_to do |format|
      format.html { render action: 'new'}
      format.json { render json: @events }
    end
  end

  # GET /tenants/1/edit
  def edit
  end

  def confirm
    @tenant = Tenant.find(params[:id])
    @product = @tenant.product
    @tenant.confirm_location = 1

    respond_to do |format|
      if @tenant.save
        ProductMailer.tenant_proposed_confirm(@tenant, @product).deliver_later

        format.html { render action: 'index', notice: 'La location a été confirmée.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render action: 'index', notice: 'Une erreur c\'est produite.'}
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  def refuse
    tenant = Tenant.destroy(params[:id])
    product = tenant.product

    respond_to do |format|
      if tenant.save
        ProductMailer.tenant_proposed_refused(tenant, product).deliver_now

        format.html { render :index, notice: 'La location a été refusée.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render action: 'index', notice: 'Une erreur c\'est produite.'}
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /tenants
  # POST /tenants.json
  def create
    @tenant = Tenant.new(tenant_params)
    @product = Product.find(@tenant.product_id)

    respond_to do |format|
      if @tenant.save
        ProductMailer.tenant_proposed_location(@tenant, @product).deliver_later

        format.html { redirect_to @product, notice: 'La demande a bien été envoyée.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json
  def update
    respond_to do |format|
      if @tenant.update(tenant_params)
        format.html { redirect_to @tenant, notice: 'Tenant was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant }
      else
        format.html { render :edit }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenants/1
  # DELETE /tenants/1.json
  def destroy
    @tenant.destroy
    respond_to do |format|
      format.html { redirect_to tenants_url, notice: 'Tenant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_params
      params.require(:tenant).permit(:lastname, :firstname, :address, :npa, :email, :date_start, :date_end, :utilisation, :product_id, :city)
    end
end
