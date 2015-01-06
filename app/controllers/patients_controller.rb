class PatientsController < PeopleController

  def index
    @patients = Patient.all
  end
  
end