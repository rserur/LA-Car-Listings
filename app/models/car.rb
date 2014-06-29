class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer, presence: true
  validates :color, presence: true
  validates :year, presence: true, inclusion: { in: 1920..Date.today.year }, format: { with: /(19|20)\d{2}/i,
    message: "should be a four-digit year" }
  validates :mileage, presence: true
end
