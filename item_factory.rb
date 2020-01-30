require './processors.rb'

class ItemProcessorFactory
  def self.create(item)
    case item.name
    when 'Aged Brie'
      AgedBrieDailyProcessor.new(item)
    when 'Sulfuras, Hand of Ragnaros'
      SulfurasDailyProcessor.new(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      BackstagePassesDailyProcessor.new(item)
    when 'Conjured Mana Cake'
      ConjuredDailyProcessor.new(item)
    else
      OrdinaryDailyProcessor.new(item)
    end
  end
end
