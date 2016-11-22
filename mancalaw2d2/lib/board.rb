require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) {Array.new([])}
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      @cups[idx] = [:stone, :stone, :stone, :stone] unless idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0,5)
      raise 'Invalid starting cup'
    elsif !start_pos.between?(7,12)
      raise 'Invalid starting cup'
    elsif @cups[start_pos].empty?
      raise 'Invalid starting cup'
    end
  end

  def make_move(start_pos, current_player_name)
    # debugger
    stones = @cups[start_pos].length

    idx = 1
    @cups[start_pos] = []

    while stones != 0
      # debuqgger if start_pos == 12
      if @name2 == current_player_name
        unless (start_pos + idx) == 6
          @cups[(start_pos + idx) % 13] << :stone
          stones -= 1
        end
      else
        unless start_pos + idx == 13
          @cups[(start_pos + idx) % 13] << :stone
          stones -= 1
        end
      end
      idx += 1
    end
    ending_cup_idx = (start_pos + idx - 1 ) % 14
    render
    next_turn(ending_cup_idx)


  end

  def next_turn(ending_cup_idx)
# debugger
    if ending_cup_idx == 13 || ending_cup_idx == 6
      :prompt
    elsif @cups[ending_cup_idx] && @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |arr| arr.empty? } || @cups[6..12].all? { |arr| arr.empty? }
  end

  def winner
    return :draw if @cups[6] == @cups[13]
    rocket = @cups[6].length <=> @cups[13].length
    if  rocket > 0
      @name1
    else
      @name2
    end

  end
end
