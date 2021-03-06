class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @therapists = Therapist.all
    if params[:therapist_id]
    @appointments = Appointment.where(therapist_id: params[:therapist_id]).order("created_at")      
    @therapist = Therapist.find(params[:therapist_id])            
    else
    @appointments = Appointment.order("created_at")
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @apptskills = AppointmentSkill.where(appointment_id: @appointment.id)
    @group_by_section = @apptskills.group_by { |s| s.section_title }.sort_by {|t, _| t[:id]}
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @clients = Client.order(:initials)
    @therapists = Therapist.order(:first_name)
  end

  # GET /appointments/1/edit
  def edit
    @clients = Client.order(:initials)
    @therapists = Therapist.order(:first_name)
    @goals = Goal.where(therapist_id: @appointment.therapist.id, status: :active)
#    @skills = AppointmentSkill.where(appointment_id: @appointment.id)
    @apptskills = AppointmentSkill.where(appointment_id: @appointment.id)
    @group_by_section = @apptskills.group_by { |s| s.section_title }   
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new appointment_params
    @clients = Client.order(:initials)
    @therapists = Therapist.order(:first_name)
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to edit_appointment_path(@appointment), notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:therapist_id, :user_id, :client_id, :session_length, :general_notes, :behavior_management_notes, :behavior_management_score, :structured_lesson_notes, :structured_lesson_score, :natural_environment_notes, :natural_environment_score, :administrative_notes, :administrative_score, :language_promotion_notes, :language_promotion_score, :goals, appointment_skills_attributes: [:id, :appointment_id, :skill_id, :rating, :position])  
    end
    


    
    
    

end
