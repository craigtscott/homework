class Map
  def initialize
    @mvar = []

      def assign(key, val)
        if key_exist(key)
          remove(key)
          assign(key,val)
        else
          @mvar << [key,val]
        end
      end

      def key_exist(key)
        @mvar.any? { |el| el[0] == key }
      end

    
end


# assign(key, value), lookup(key), remove(key), show
