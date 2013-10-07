class Project
  include Mongoid::Document
  
  field :name, :type => String
  field :platform, :type => String
  field :location, :type => String
  
end