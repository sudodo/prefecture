class Soumu
  def initialize
    @csv_file = open("071001_1.csv")
  end

  def prefecture
    @prefecture = []

    @csv_file.each do |prefecture_list|
      if prefecture_list.split(/,/)[2] == "\n"
        @prefecture << prefecture_list
      end
    end

    @prefecture
  end
end

class Prefecture
  def initialize
    @csv_file = open("prefecture.csv","w")
  end

  def create_file
    soumu = Soumu.new
    
    soumu.prefecture.each do |prefecture|
      @csv_file.puts prefecture
    end
  end
end

prefecture = Prefecture.new
prefecture.create_file