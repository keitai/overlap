class AppointmentSkillsController < ApplicationController
  before_action :set_appointment_skill, only: [:show, :edit, :update, :destroy]

  # GET /appointment_skills
  # GET /appointment_skills.json
  def index
    @appointment_skills = AppointmentSkill.all
  end

  # GET /appointment_skills/1
  # GET /appointment_skills/1.json
  def show
  end

  # GET /appointment_skills/new
  def new
    @appointment_skill = AppointmentSkill.new
  end

  # GET /appointment_skills/1/edit
  def edit
  end

  # POST /appointment_skills
  # POST /appointment_skills.json
  def create
    @appointment_skill = AppointmentSkill.new(appointment_skill_params)

    respond_to do |format|
      if @appointment_skill.save
        format.html { redirect_to @appointment_skill, notice: 'Appointment skill was successfully created.' }
        format.json { render :show, status: :created, location: @appointment_skill }
      else
        format.html { render :new }
        format.json { render json: @appointment_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointment_skills/1
  # PATCH/PUT /appointment_skills/1.json
  def update
    respond_to do |format|
      if @appointment_skill.update(appointment_skill_params)
        format.html { redirect_to @appointment_skill, notice: 'Appointment skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment_skill }
      else
        format.html { render :edit }
        format.json { render json: @appointment_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointment_skills/1
  # DELETE /appointment_skills/1.json
  def destroy
    @appointment_skill.destroy
    respond_to do |format|
      format.html { redirect_to appointment_skills_url, notice: 'Appointment skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment_skill
      @appointment_skill = AppointmentSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_skill_params
      params.fetch(:appointment_skill, {})      
    end
    def appointment_skill_params
      params.require(:appointment_skill).permit(:appointment_id, :rating, :skill_id, :position, :section_id, :section_title)  
    end
end
