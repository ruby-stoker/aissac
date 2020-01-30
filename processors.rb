class OrdinaryDailyProcessor
  def initialize(item)
    @item = item
  end

  def run
    decrement = @item.sell_in.positive? ? 1 : 2
    @item.sell_in -= 1
    @item.quality -= decrement
    @item.quality = 0 if @item.quality.negative?
  end
end

class AgedBrieDailyProcessor
  def initialize(item)
    @item = item
  end

  def run
    increment = @item.sell_in.positive? ? 1 : 2
    @item.sell_in -= 1
    @item.quality += increment
    @item.quality = 50 if @item.quality > 50
  end
end

class SulfurasDailyProcessor
  def initialize(item)
    @item = item
  end

  def run
    @item.sell_in -= 1
    @item.quality = 80
  end
end

class BackstagePassesDailyProcessor
  def initialize(item)
    @item = item
  end

  def run
    @item.sell_in -= 1
    increment =
        case @item.sell_in
        when 10..Float::INFINITY
          1
        when 6..9
          2
        when 0..5
          3
        else
          0
        end
    @item.quality += increment
    @item.quality = 0 if @item.sell_in.negative?
    @item.quality = 50 if @item.quality > 50
  end
end

class ConjuredDailyProcessor
  def initialize(item)
    @item = item
  end

  def run
    decrement = !@item.sell_in.positive? ? 4 : 2
    @item.sell_in -= 1
    @item.quality -= decrement
    @item.quality = 0 if @item.quality.negative?
  end
end
