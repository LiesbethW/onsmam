class PatientsController < PeopleController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to({action: :index}, notice: "Yay! A new patient!")
    else
      render 'new'
    end

  end

  def show
    @patient = Patient.find(params[:id])
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name,:surname_prefix,:last_name,:date_of_birth,:male,
      :address_street, :address_postal_code, :address_city, :email, :telephone_number, :insurance_no, :bsn)
  end   
  
end