require 'puppet/cloudpack'
require 'puppet/face/node_aws'

Puppet::Face.define :node_aws, '0.0.1' do
  action :init do
    summary 'Initialize an existing EC2 machine instance.'
    description <<-EOT
      This action classifies an existing Amazon EC2 instance and signs it's certificate.
    EOT
    Puppet::CloudPack.add_init_options(self)
    when_invoked do |server,options|
      Puppet::CloudPack.init(server, options)
    end
  end
end
