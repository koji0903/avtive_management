class Item < ActiveRecord::Base
  belongs_to :unit
  belongs_to :updated_person
end
