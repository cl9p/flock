class Template
  include Mongoid::Document
  has_many :configurations
  
  field :name, :type => String
  field :image_location, :type => String
  field :provider, :type => String
  field :os_name, :type => String
  field :os_version, :type => String
  field :container_support, :type => Boolean
  field :version, :type => String
  
  def bullet
    return "#{provider}.png"
  end
   
end

class Configuration
  include Mongoid::Document
  belongs_to :template 
  
  field :name, :type => String
  field :cpu, :type => Integer
  field :memory, :type => Integer
  field :disk_size, :type => Integer

end
