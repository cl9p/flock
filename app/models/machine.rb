class Machine
  include Mongoid::Document
  belongs_to :template
  belongs_to :configuration
  
  field :name, :type => String
  field :ip_addr, :type => String
  field :uname, :type => String
  field :pword, :type => String
  field :tags, :type => Array
  
end
