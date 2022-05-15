require_relative 'lifecycle'

lifecycle = LifeCycle.new

while lifecycle.has_funds?
  lifecycle.next_day
end
