class Template
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :configurations, inverse_of: nil
  has_many :machines

  field :name, :type => String
  field :os_name, :type => String
  field :os_version, :type => String
  field :container_support, :type => Boolean
  field :version, :type => String
  
  def bullet
    return "#{_type.downcase}.png"
  end
  
  def name_type
    return "#{name}-#{_type.downcase}"
  end
 
end

class Amazon < Template
  field :amazon_access_key, :type => String
  field :amazon_secret_key, :type => String
  field :ami_id, :type => String
  
  def self.model_name
      Template.model_name
  end
end

class VMware < Template
  field :vcenter_host, :type => String
  field :vcenter_user_name, :type => String
  field :vcenter_password, :type => String
  field :base_image_name, :type => String
  field :clone_to_location, :type => String
  
  def self.model_name
      Template.model_name
  end
end

class RackSpace < Template
  field :image_id, :type => String
  field :rackspace_access_key, :type => String
  field :rackspace_secret_key, :type => String
  
  def self.model_name
      Template.model_name
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
