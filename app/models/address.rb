class Address
  include Mongoid::Document
  include Mongoid::Timestamps
  field :address1, type: String
  field :locality, type: String
  field :city, type: String
  field :zip, type: String
  field :country, type: String
  
  embedded_in :addressable, polymorphic: true
end
