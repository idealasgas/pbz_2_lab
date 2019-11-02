class TechnicsRepairDocumentsController < ApplicationController
  def new
  end

  def create
    binding.pry
    validate_params

    if @errors.blank?


      redirect_to technics_repair_documents_path
    else
      flash[:errors] = @errors
      redirect_to new_technics_repair_document_path
    end
  end

  private

  def validate_params
    @errors = []

    if params[:repair_document][:start_date].blank?
      @errors.push('Ремонт должен когда-то начинаться')
    end

    if params[:repair_document][:type].blank?
      @errors.push('У ремонта должен быть тип')
    end

    if params[:repair_document][:term].blank?
      @errors.push('У ремонта должен быть срок')
    end

    if params[:repair_document][:client_id].present?
      employee = Employee.find(params[:repair_document][:client_id])
      @errors.push("Не существует сотрудника с номером #{params[:repair_document][:client_id]}") if employee.blank?
    else
      @errors.push('Нужно указать номер сотрудника, который сдал технику в ремонт')
    end

    if params[:repair_document][:receiver_id].present?
      employee = Employee.find(params[:repair_document][:receiver_id])
      @errors.push("Не существует сотрудника с номером #{params[:repair_document][:receiver_id]}") if employee.blank?
    else
      @errors.push('Нужно указать номер сотрудника, который принял технику в ремонт')
    end

    if params[:repair_document][:repair_man_id].present?
      employee = Employee.find(params[:repair_document][:repair_man_id])
      @errors.push("Не существует сотрудника с номером #{params[:repair_document][:repair_man_id]}") if employee.blank?
    else
      @errors.push('Нужно указать номер сотрудника, который будет выполнять ремонт')
    end
  end
end
