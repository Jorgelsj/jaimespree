# encoding: utf-8

require 'helper'

# Author: wiseleyb<wiseleyb@gmail.com>
class TestAddressAU < Test::Unit::TestCase

  def test_au_state_abbr_insertion
    arr = FFaker::AddressAU::STATE_ABBR.sort
    assert arr = FFaker::AddressAU::SUBURB.keys.sort
    assert arr = FFaker::AddressAU::POSTCODE.keys.sort
  end

  def test_au_state
    assert_match /[ a-z]/, FFaker::AddressAU.state
  end

  def test_au_state_abbr
    assert_match /[A-Z]/, FFaker::AddressAU.state_abbr
  end

  def test_au_suburb
    assert_match /[a-zA-Z]/, FFaker::AddressAU.suburb
  end

  def test_postcode
    assert_match /\d{4}/, FFaker::AddressAU.postcode
  end

  def test_full_address
    assert_match /[\, a-z]/, FFaker::AddressAU.full_address
  end

  def test_au_suburb_with_states
    FFaker::AddressAU::STATE_ABBR.each do |st_abbr|
      assert_match /[a-zA-Z]/, FFaker::AddressAU.suburb(st_abbr)
    end
  end

  def test_au_suburb_with_state_and_postcodes
    FFaker::AddressAU::STATE_ABBR.each do |st_abbr|
      p_code = FFaker::AddressAU.postcode(st_abbr)
      assert_match /[a-zA-Z]/, FFaker::AddressAU.suburb(st_abbr, p_code)
    end
  end

  def test_postcode_with_states
    FFaker::AddressAU::STATE_ABBR.each do |st_abbr|
      assert_match /\d{4}/, FFaker::AddressAU.postcode(st_abbr)
    end
  end

  def test_full_address_with_states
    FFaker::AddressAU::STATE_ABBR.each do |st_abbr|
      assert_match /[\, a-z]/, FFaker::AddressAU.full_address(st_abbr)
    end
  end
end