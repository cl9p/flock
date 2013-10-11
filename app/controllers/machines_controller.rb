require 'java'
java_import java.net.URL

module VIM 
  puts 'Entering VIM'
  jars_dir = File.join(Rails.root, 'lib/java')
  puts jars_dir.inspect
  for jar in Dir["#{jars_dir}/*.jar"]
    require jar
    puts jar.inspect
  end
  include_package 'com.vmware.vim25'
  include_package 'com.vmware.vim25.mo'
end

class MachinesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /machines
  # GET /machines.json
  def index
    @machines = Machine.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @machines }
    end
  end

  # GET /machines/1
  # GET /machines/1.json
  def show
    @machine = Machine.find(params[:id])
    @machines = Machine.all
    @templates = Template.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @machine }
    end
  end

  # GET /machines/new
  # GET /machines/new.json
  def new
    @machine = Machine.new
    @machines = Machine.all
    @templates = Template.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @machine }
    end
  end

  # GET /machines/1/edit
  def edit
    @machine = Machine.find(params[:id])
    @machines = Machine.all
    @templates = Template.all
  end

  # POST /machines
  # POST /machines.json
  def create
    @machine = Machine.new(params[:machine])
    
    
    respond_to do |format|
      if @machine.save
        self.send("provision_#{@machine.template._type.downcase}")
        format.html { redirect_to @machine, notice: 'Machine was successfully created.' }
        format.json { render json: @machine, status: :created, location: @machine }
      else
        format.html { render action: "new" }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /machines/1
  # PUT /machines/1.json
  def update
    @machine = Machine.find(params[:id])

    respond_to do |format|
      if @machine.update_attributes(params[:machine])
        format.html { redirect_to @machine, notice: 'Machine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machines/1
  # DELETE /machines/1.json
  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy

    respond_to do |format|
      format.html { redirect_to machines_url }
      format.json { head :no_content }
    end
  end
  
  def provision_vmware
    # Do Some Magic
    url = URL.new("https://#{@machine.template.vcenter_host}/sdk")
    service_instance = VIM::ServiceInstance.new(url, @machine.template.vcenter_user_name, @machine.template.vcenter_password, true)
    root_folder = service_instance.getRootFolder
    vm = VIM::InventoryNavigator.new(root_folder).searchManagedEntity("VirtualMachine", @machine.template.base_image_name)
    folder = VIM::InventoryNavigator.new(root_folder).searchManagedEntity("Folder", @machine.template.clone_to_location)
    config_spec = VIM::VirtualMachineConfigSpec.new
    config_spec.setNumCPUs(@machine.configuration.cpu)
    config_spec.setMemoryMB(@machine.configuration.memory)
    vm_clone_spec = VIM::VirtualMachineCloneSpec.new
    vm_relocate_spec = VIM::VirtualMachineRelocateSpec.new
    vm_clone_spec.setLocation(vm_relocate_spec)
    vm_clone_spec.setPowerOn(false)
    vm_clone_spec.setTemplate(false)
    vm_clone_spec.setConfig(config_spec)
    clone_task = vm.cloneVM_Task(folder, @machine.name, vm_clone_spec) 
    service_instance.getServerConnection.logout   
  end
  
  def provision_amazon 
    ec2 = AWS::EC2.new(:access_key_id => @machine.template.amazon_access_key, :secret_access_key => @machine.template.amazon_secret_key)
    ec2.instances.create :image_id => @machine.template.ami_id
  end
  
  def provision_rackspace 
    
  end
end
