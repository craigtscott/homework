require 'byebug'
class LRUCache

  def initialize(max= 4)
    @cache = []
    @max = max
  end

  def count
    @cache.size
    # returns number of elements currently in cache
  end

  def add(el)
    # byebug
    if at = el_include(el)
      @cache.delete_at(at)
      @cache << el
    elsif count < @max
      @cache << el
    else
      @cache.shift
      @cache << el
    end
    # adds element to cache according to LRU principle
  end

  def show
    p @cache
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!

  def el_include(el)
    @cache.each_with_index do |el2, idx|
      return idx if el == el2
    end
    nil
  end
end
