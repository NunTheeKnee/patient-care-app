class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to root_path, notice: "Doctor was saved successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctor_path(@doctor), notice: "Doctor was updated successfully"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @doctor.destroy
      redirect_to doctors_path, notice: "Deleted successfully"
    else
      redirect_to root_path, alert: "There was an error deleting the doctor"
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :contact, :email, :degree)
  end
end
