# access ec2 user-data values via a custom Puppet function

module Puppet::Parser::Functions
    newfunction(:userdata, :type => :rvalue) do |args|
        lookupvar("ec2_userdata_" + args[0])
    end
end
