class TransferDocumentsController < ApplicationController
  def index
    @units = TechnicsUnit.all
  end
end
