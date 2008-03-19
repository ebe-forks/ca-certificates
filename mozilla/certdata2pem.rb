#!/usr/bin/ruby

while line = $stdin.gets
  next if line =~ /^#/
  next if line =~ /^\s*$/
  line.chomp!
  if line =~ /CKA_LABEL/
    label,type,val = line.split(' ',3)
    val.sub!(/^"/, "")
    val.sub!(/"$/, "")
    fname = val.gsub(/\//,"_").gsub(/\s+/, "_").gsub(/[()]/, "=").gsub(/,/, "_") + ".crt"
    next
  end
  if line =~ /CKA_VALUE MULTILINE_OCTAL/
    data=''
    while line = $stdin.gets
      break if /^END/
      line.chomp!
      line.gsub(/\\([0-3][0-7][0-7])/) { data += $1.oct.chr }
    end
    open(fname, "w") do |fp|
      fp.puts "-----BEGIN CERTIFICATE-----"
      fp.puts [data].pack("m*")
      fp.puts "-----END CERTIFICATE-----"
    end
    puts "Created #{fname}"
  end
end
# system("c_rehash", ".")
