require 'byebug'
class Map
  def initialize
    @mvar = []
  end

  def assign(key, val)
    if key_exist(key)
      remove(key)
      assign(key, val)
    else
      @mvar << [key, val]
    end
  end

  def key_exist(key)
    @mvar.any? { |el| el[0] == key }
  end

  def remove(key)
    # debugger
    @mvar.each_index do |idx|
      @mvar.slice!(idx) if @mvar[idx][0] == key
    end
  end

  def lookup(key)
    # debugger
    @mvar.each_index do |idx|
      puts @mvar[idx][1] if @mvar[idx][0] == key
    end
  end

  def show
    @mvar.each_index do |idx|
      puts "#{@mvar[idx][0]} ~> #{@mvar[idx][1]}"
    end
  end
end

# b = Map.new
# b.assign('a', 1)
# b.assign('b', 2)
# b.assign('c', 3)
# b.assign('d', 4)
# assign(key, value), lookup(key), remove(key), show
