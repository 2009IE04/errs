# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'fastercsv'

class Array
  #必要なもののカラム名を配列で渡す
  def to_csv(columns = [])
    return if self.size == 0
    FasterCSV.generate(:headers => columns, :write_headers => true) do |csv|
      self.each { |model| csv << columns.map {|column|
          model.attributes[column.to_s]} }
    end
  end
end
