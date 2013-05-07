# creates facts for EC2 user-data

# retrieve the user-data from the HTTP API
result = `#{'/usr/bin/wget -q -O - http://169.254.169.254/latest/user-data'}`
lines = result.split("\n")

lines.each do |line|
    buff = line.split('=', 2)
    key = buff[0]
    val = buff[1]

    # add a fact for each user-data key-value pair
    Facter.add("ec2_userdata_" + key) do
        setcode do
          val
        end
    end
end
