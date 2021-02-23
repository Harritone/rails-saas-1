class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.implicit_order_column = 'created_at' # Set order_by created_at as we use UUID as primary key
end
