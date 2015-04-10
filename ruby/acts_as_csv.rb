module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    attr_accessor :headers, :csv_contents
    def initialize
      read
    end

    def each &block
      csv_contents.map{|array| CsvRow.new(headers, array)}.each{|row|
        block.yield(row)
      }
    end
  end

  class CsvRow
    attr_reader :headers, :values
    def initialize(headers, values) 
      @headers, @values = headers, values
    end

    def method_missing(name, *args, &block)
      index = headers.index(name.to_s)
      if index
        values[index]
      end
    end
  end
end

class MyCsv
  include ActsAsCsv
  acts_as_csv


  def method_missing(name, *args, &block)
    name
  end
end

csv = MyCsv.new
