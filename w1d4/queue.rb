class Queue

  def initialize
    @qvar = []
  end

  def enqueue(el)
    @qvar << el
  end

  def dequeue
    @qvar.shift
  end

  def show
    @qvar.each { |el| puts el }
  end
  
end







#enqueue(el), dequeue, and show
