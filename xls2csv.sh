#! /usr/bin/ruby

require 'roo'

# change excel files to csv
begin
  Dir["/path_to_xls/*.xls"].each do |file|  
    file_path = "#{file}"
    file_basename = File.basename(file, ".xls")
    xls = Roo::Excel.new(file_path)
    xls.to_csv("/path_to_save_csv/#{file_basename}.csv")
  end
end
