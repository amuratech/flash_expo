class Developer
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :description, type: String
  field :logo, type: String
  field :phone, type: String
  field :email, type: String
  field :package, type: String
  
  has_many :projects
  embeds_one :address, as: :addressable
  
  mount_uploader :logo, LogoUploader
  attr_accessible :logo
  
end
