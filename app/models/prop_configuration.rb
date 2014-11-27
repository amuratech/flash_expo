class PropConfiguration
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :carpet, type: String
  field :saleable, type: String
  field :base_cost, type: Integer
  field :total_cost, type: Integer
  field :rate, type: Integer
  
  belongs_to :project
  belongs_to :developer
  
end
