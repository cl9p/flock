class Template
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_and_belongs_to_many :configurations, inverse_of: nil
  belongs_to :provider
  
  field :name, :type => String
  field :image_location, :type => String
  field :os_name, :type => String
  field :os_version, :type => String
  field :container_support, :type => Boolean
  field :version, :type => String
  
  attr_accessible :created_at, :updated_at
   
end

class Provider
  include Mongoid::Document
  has_many :templates
  
  field :name, :type => String
  field :view_name, :type => String
  
  def bullet
    return "#{name}.png"
  end
end

class Configuration
  include Mongoid::Document
  has_and_belongs_to_many :templates 
  
  field :name, :type => String
  field :cpu, :type => Integer
  field :memory, :type => Integer
  field :disk_size, :type => Integer

end
