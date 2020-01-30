require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'
require './item_factory.rb'

class TestUntitled < Test::Unit::TestCase
  def test_ordinary_update_quality_positive_sell_in
    gilded_rose = GildedRose.new [Item.new('+5 Dexterity Vest', 1, 1)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 0)
  end

  def test_ordinary_update_quality_negative_sell_in
    gilded_rose = GildedRose.new [Item.new('+5 Dexterity Vest', -1, 2)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 0)
  end

  def test_ordinary_update_quality_quality_should_not_be_negative
    gilded_rose = GildedRose.new [Item.new('+5 Dexterity Vest', 1, 0)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 0)
  end

  def test_aged_brie_update_quality_positive_sell_in
    gilded_rose = GildedRose.new [Item.new('Aged Brie', 1, 0)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 1)
  end

  def test_aged_brie_update_quality_negative_sell_in
    gilded_rose = GildedRose.new [Item.new('Aged Brie', -1, 0)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 2)
  end

  def test_aged_brie_update_quality_should_not_be_more_50
    gilded_rose = GildedRose.new [Item.new('Aged Brie', 1, 50)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 50)
  end

  def test_sulfuras_update_quality_positive_sell_in
    gilded_rose = GildedRose.new [Item.new('Sulfuras, Hand of Ragnaros', 1, 80)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 80)
  end

  def test_sulfuras_update_quality_negative_sell_in
    gilded_rose = GildedRose.new [Item.new('Sulfuras, Hand of Ragnaros', -1, 80)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 80)
  end

  def test_backstage_passes_update_quality_sell_in_more_10
    gilded_rose = GildedRose.new [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 1)
  end

  def test_backstage_passes_update_quality_sell_in_5_to_10_range
    gilded_rose = GildedRose.new [Item.new('Backstage passes to a TAFKAL80ETC concert', 7, 0)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 2)
  end

  def test_backstage_passes_update_quality_sell_in_0_to_5_range
    gilded_rose = GildedRose.new [Item.new('Backstage passes to a TAFKAL80ETC concert', 3, 0)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 3)
  end

  def test_backstage_passes_update_quality_negative_sell_in
    gilded_rose = GildedRose.new [Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 0)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 0)
  end

  def test_backstage_passes_update_quality_should_not_be_more_50
    gilded_rose = GildedRose.new [Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 50)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 50)
  end

  def test_conjured_update_quality_positive_sell_in
    gilded_rose = GildedRose.new [Item.new('Conjured Mana Cake', 1, 2)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 0)
  end

  def test_conjured_update_quality_negative_sell_in
    gilded_rose = GildedRose.new [Item.new('Conjured Mana Cake', -1, 4)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 0)
  end

  def test_conjured_update_quality_quality_should_not_be_negative
    gilded_rose = GildedRose.new [Item.new('Conjured Mana Cake', 1, 0)]
    item = gilded_rose.items[0]
    gilded_rose.update_quality

    assert_equal(item.quality, 0)
  end
end
