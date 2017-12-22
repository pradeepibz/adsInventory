class Product < ApplicationRecord
  has_and_belongs_to_many :billings
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(7)
    (8..spreadsheet.last_row).each do |i|
      @product = Product.find_or_create_by(description: spreadsheet.row(i)[1])
      @product.update(gst: spreadsheet.row(i)[2], unit: spreadsheet.row(i)[3], rate: spreadsheet.row(i)[4], discount: spreadsheet.row(i)[5], amount: spreadsheet.row(i)[6], final_amount: spreadsheet.row(i)[7], single_price_rate: spreadsheet.row(i)[8])
    end
  end  

  def change_calculation
    unit = self.unit.to_i
    rate = self.rate.to_f
    amount = (unit * rate)
    final_amount = self.discount.to_f == 0.0 ? amount : ((amount * self.discount.to_f)/100)
    single_price = self.discount.to_f == 0.0 ? rate : (final_amount/unit)
    update_attributes(unit: unit, rate: rate, amount: amount, final_amount: final_amount, single_price_rate: single_price)
  end

end
