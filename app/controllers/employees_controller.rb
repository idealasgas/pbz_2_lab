class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    if params[:search].present?
      @employees = Employee.where(age: params[:search][:age].to_i) if params[:search][:age].present?
      @employees = @employees.where(sex: params[:search][:sex]) if params[:search][:sex].present?
      @employees = @employees.where(subdivision: params[:search][:subdivision]) if params[:search][:subdivision].present?
    end
  end

  def new
  end

  def create
    validate_params
    parameters = params[:employee]

    if @errors.blank?
      employee = Employee.create(last_name: parameters[:last_name],
                          name: parameters[:name],
                          middle_name: parameters[:middle_name],
                          position: parameters[:position],
                          subdivision: Subdivision.find_by(name: parameters[:subdivision]),
                          start_date: DateTime.parse(parameters[:start_date]),
                          sex: parameters[:sex],
                          age: parameters[:age].to_i)
      unless parameters[:finish_date].blank?
        employee.update(finish_date: parameters[:finish_date])
      end

      redirect_to employees_path
    else
      flash[:errors] = @errors
      redirect_to new_employee_path
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update # проверять старт дейт чтобы не была больше чем сегодня
    validate_params
    employee = Employee.find(params[:id])

    parameters = params[:employee]

    if @errors.blank?
      employee.update(last_name: parameters[:last_name],
                      name: parameters[:name],
                      middle_name: parameters[:middle_name],
                      position: parameters[:position],
                      subdivision: Subdivision.find_by(name: parameters[:subdivision]),
                      start_date: DateTime.parse(parameters[:start_date]),
                      sex: parameters[:sex],
                      age: parameters[:age].to_i)

      redirect_to employees_path
    else
      flash[:errors] = @errors
      redirect_to edit_employee_path(employee)
    end
  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy

    redirect_to employees_path
  end

  private

  def validate_params
    @errors = []
    if params[:employee][:name].blank?
      @errors.push("У сотрудника должно быть имя")
    end

    if params[:employee][:last_name].blank?
      @errors.push("У сотрудника должна быть фамилия")
    end

    if params[:employee][:middle_name].blank?
      @errors.push("У сотрудника должно быть отчество")
    end

    if params[:employee][:start_date].blank?
      @errors.push("Нужно указать начало работы сотрудника")
    end

    if params[:employee][:position].blank?
      @errors.push("У сотрудника должна быть должность")
    end

    if params[:employee][:subdivision].blank?
      @errors.push("Нужно указать подразделение сотрудника")
    end

    if params[:employee][:sex].blank?
      @errors.push("Нужно указать пол сотрудника")
    end

    if params[:employee][:age].blank?
      @errors.push("Нужно указать возраст сотрудника")
    end
  end
end
