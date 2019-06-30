require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

describe file('/usr/local/share/w3af/w3af_console') do
  it { should be_file }
  it { should be_executable }
end

#describe command('/usr/local/share/w3af/w3af_console -v') do
#  its(:stdout) { should match /Version/ }
#  its(:exit_status) { should eq 0 }
#end

