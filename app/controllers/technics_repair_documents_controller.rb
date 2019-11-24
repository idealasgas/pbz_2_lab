class TechnicsRepairDocumentsController < ApplicationController
  def new
  end

  def create
    validate_params
    parameters = params[:repair_document]

    if @errors.blank?
      doc = TechnicsRepairDocument.create(start_date: parameters[:start_date],
                                          repair_type: parameters[:type],
                                          term: parameters[:term].to_i,
                                          technics_unit_id: parameters[:unit_id].to_i,
                                          client_id: parameters[:client_id].to_i,
                                          receiver_id: parameters[:receiver_id].to_i,
                                          repair_man_id: parameters[:repair_man_id].to_i)
      invoice = Invoice.create(technics_repair_document: doc,
                               reception_date: parameters[:reception_date],
                               price: parameters[:price],
                               names: parameters[:names].split(',').map(&:strip))

      redirect_to technics_repair_documents_path
    else
      flash[:errors] = @errors
      redirect_to new_repair_document_path(parameters[:unit_id].to_i)
    end
  end

  def index
    @repair_documents = TechnicsRepairDocument.all
  end

  def subdivision
    subdivisions = TechnicsRepairDocument.pluck(:client_id).map { |id| Employee.find(id).subdivision }
    counts = Hash.new(0)
    subdivisions.each { |name| counts[name] += 1 }
    @subdivisions = counts.select{ |key, value| value == counts.values.max }.keys
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

    if params[:repair_document][:names].blank?
      @errors.push('Должен быть список названий деталей')
    end

    if params[:repair_document][:price].blank?
      @errors.push('Нужно указать цену')
    end

    if params[:repair_document][:reception_date].blank?
      @errors.push('Нужно указать дату получения деталей')
    end
  end
end
