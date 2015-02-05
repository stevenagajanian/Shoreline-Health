class TreatmentsController < ApplicationController

  def index
    @treatments = Treatment.all.order('name ASC')
  end

  def show
    @treatment = Treatment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @treatment }
    end
  end

  def edit
    @treatment = Treatment.find(params[:id])
    #@conditions = @treatment.conditions

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @treatment }
    end
  end

  def update
    @treatment = Treatment.find(params[:id])
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to @treatment, notice: 'Treatment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @treatment = Treatment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @treatment }
    end
  end

  def destroy
    @treatment = Treatment.find(params[:id])
    @treatment.destroy
    redirect_to treatments_path, :notice => "Successfully destroyed treatment."
  end

  def create
    @treatment = Treatment.new( treatment_params)

    respond_to do |format|
      if @treatment.save
        format.html { redirect_to treatments_path, notice: 'Success!' }
        format.json { render json: @treatment, status: :created, location: @treatment }
      else
        format.html { render action: "new" }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def treatment_params
    params.require(:treatment).permit(:name, :description)
  end
end
