class InvoicesController < ApplicationController
  def new
  end

  def create
    Invoice.create()
  end
end
