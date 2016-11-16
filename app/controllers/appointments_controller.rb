class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @doctors = Doctor.all.map { |d| [d.name, d.id]}
    @patients = Patient.all.map { |p| [p.name, p.id] }
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:notice] = "Appointment Created"
      redirect_to root_path
    else
      redirect_to new_appointment_path, alert: @appointment.errors.full_messages.to_sentence
    end

  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      flash[:notice] = "Appointment Updated"
      redirect_to root_path
    else
      redirect_to edit_appointment_path, alert: @appointment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to :back
  end

  private
  def appointment_params
    params.require(:appointment).permit(:time, :date, :reason, :doctor_id, :patient_id)
  end
end
