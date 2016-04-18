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

  def stormy? 
    @stormy
  end

  def launch(plane)
    raise 'Unable to takeoff in stormy weather.' if stormy?
    raise 'No planes for take off.' if empty? 
    @planes.pop
  end

  def land(plane)
    raise 'Airport is full.' if full?
    raise 'Unable to land in stormy weather.' if stormy?
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