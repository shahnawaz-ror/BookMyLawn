class SubdomainsController < ApplicationController
  before_action :set_subdomain, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  skip_before_action :ensure_subdomain, only: [:new, :create]
  # GET /subdomains
  # GET /subdomains.json
  def index
    @subdomains = Subdomain.all
  end

  # GET /subdomains/1
  # GET /subdomains/1.json
  def show
  end

  # GET /subdomains/new
  def new
    @subdomain = Subdomain.new
  end

  # GET /subdomains/1/edit
  def edit
  end

  # POST /subdomains
  # POST /subdomains.json
  def create
    subdomains_params = subdomain_params
    subdomains_params[:user_id] = User.last.id
    @subdomain = Subdomain.new(subdomains_params)

    respond_to do |format|
      if @subdomain.save
        format.html { redirect_to @subdomain, notice: 'Subdomain was successfully created.' }
        format.json { render :show, status: :created, location: @subdomain }
      else
        format.html { render :new }
        format.json { render json: @subdomain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subdomains/1
  # PATCH/PUT /subdomains/1.json
  def update
    subdomains_params = subdomain_params
    subdomains_params[:user_id] = current_user.id
    respond_to do |format|
      if @subdomain.update(subdomain_params)
        format.html { redirect_to @subdomain, notice: 'Subdomain was successfully updated.' }
        format.json { render :show, status: :ok, location: @subdomain }
      else
        format.html { render :edit }
        format.json { render json: @subdomain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subdomains/1
  # DELETE /subdomains/1.json
  def destroy
    @subdomain.destroy
    respond_to do |format|
      format.html { redirect_to subdomains_url, notice: 'Subdomain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subdomain
      @subdomain = current_domain
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subdomain_params
      params.require(:subdomain).permit(:name, :subdomain, :user_id)
    end
end
