class BillingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @billings = Billing.all
  end
  def new
    @billing = Billing.new
    @billing.products.build
  end
end
