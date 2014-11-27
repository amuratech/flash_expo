class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :description, type: String
  field :status, type: String
  field :possession, type: String
  field :total_units, type: Integer
  field :sizes, type: Array
  field :total_area, type: String
  field :specifications, type: Array
  field :amenities, type: Array
  field :logo, type: String
  field :lat, type: String
  field :lng, type: String
  
  belongs_to :developer
  has_many :prop_configurations
  embeds_one :address, as: :addressable
end
