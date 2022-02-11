class Translate < ApplicationRecord
  def myMethod
    puts "This category has 'product'."
  end
  def helpers
    ActionController::Base.helpers
  end
end