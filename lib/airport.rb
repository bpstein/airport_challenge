require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 50
  
  attr_reader :planes, :weather
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = weather
  end

  def launch(plane)
    raise 'Unable to takeoff in stormy weather.' if stormy?
    raise 'No planes for take off.' if empty? 
    @planes.pop
  end

  def land(plane)
    raise 'Unable to land in stormy weather.' if stormy?
    raise 'Airport is full.' if full?
    @planes << plane
  end

  private

  def full?
    @planes.count == DEFAULT_CAPACITY
  end

  def empty? 
    @planes.empty? 
  end

end