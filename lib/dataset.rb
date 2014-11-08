require 'csv'

class Dataset
  attr_reader :data

  def initialize(filename)
    load_data CSV.parse( File.open(filename) )
  end


  def where(hash={})
    @data.select do |item|
      item[hash.keys.first] == hash.values.first
    end
  end

  private
  def load_data(array)
    headers = array.shift
    @data = []
    array.each do |a|
      h = {}
      a.each.with_index do |v,index|
        h[headers[index].downcase.underscore.to_sym] = v
      end
      @data << h
    end
  end

end
