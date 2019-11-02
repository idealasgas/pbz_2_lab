class TechnicsUnitsController < ApplicationController
  def new
  end

  def create
    validate_params

    if @errors.blank?
      unit = TechnicsUnit.create(name: params[:technics_unit][:name],
                          model: params[:technics_unit][:model],
                          production_year: params[:technics_unit][:production_year].to_i,
                          subdivision: params[:technics_unit][:subdivision])
      unit.update(inventory_number: SecureRandom.hex(10))
      transfer = TransferDocument.create(technics_unit: unit, start_date: DateTime.now, subdivision: params[:technics_unit][:subdivision])

      redirect_to technics_units_path
    else
      flash[:errors] = @errors
      redirect_to new_technics_unit_path
    end
  end

  def index
    @units = TechnicsUnit.all
  end

  def edit
    @unit = TechnicsUnit.find(params[:id])
  end

  def update
    validate_params
    unit = TechnicsUnit.find(params[:id])

    if @errors.blank?
      if unit.subdivision != params[:technics_unit][:subdivision]
        unit.transfer_documents.last.update(finish_date: DateTime.now)
        TransferDocument.create(technics_unit: unit, start_date: DateTime.now, subdivision: params[:technics_unit][:subdivision])
      end

      unit.update(name: params[:technics_unit][:name],
                  model: params[:technics_unit][:model],
                  production_year: params[:technics_unit][:production_year].to_i,
                  subdivision: params[:technics_unit][:subdivision])

      redirect_to technics_units_path
    else
      flash[:errors] = @errors
      redirect_to edit_technics_unit_path(unit)
    end
  end

  def destroy
    @technics_unit = TechnicsUnit.find(params[:id])
    @technics_unit.destroy

    redirect_to technics_units_path
  end

  private

  def validate_params
    @errors = []
    if params[:technics_unit][:name].blank?
      @errors.push("Name can't be blank")
    end

    if params[:technics_unit][:model].blank?
      @errors.push("Model can't be blank")
    end

    if params[:technics_unit][:production_year].blank?
      @errors.push("Production year can't be blank")
    end

    if params[:technics_unit][:subdivision].blank?
      @errors.push("Subdivision can't be blank")
    end
  end
end
