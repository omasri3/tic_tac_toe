class Cross
  @@total_num_cross = 0
  attr_reader :cross
  attr_accessor :total_num_cross

  def initialize()
    @@total_num_cross += 1
    @cross = 'X'
  end

  def self.total_num_cross
    @@total_num_cross
  end

end
