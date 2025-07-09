class Circle

  @@total_num_circle = 0
  attr_reader :circle

  def initialize ()
    @@total_num_circle += 1
    @circle = 'O'
  end
end
