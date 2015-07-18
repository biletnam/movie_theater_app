require 'test_helper'
require 'credit_card_validator'

class BookingTest < ActiveSupport::TestCase
  def setup
    @booking = bookings(:new_booking)
  end

  def test_validations
    @booking.save
    assert_equal @booking.errors.count, 5

    @booking.cc_number = 4242424242424242
    @booking.save
    assert_equal @booking.errors.count, 4

    @booking.cc_exp_yr = "2018"
    @booking.cc_exp_mon = "02"
    @booking.save
    assert_equal 3, @booking.errors.count

    @booking.email = 'aaa.com'
    @booking.save
    assert_equal @booking.errors.count, 2

    @booking.email = 'pjg5005@gmail.com'
    @booking.save
    assert_equal @booking.errors.count, 1

    @booking.name = 'Paul'
    assert @booking.save
  end

  def test_truncate_cc_number
    booking = bookings(:existing_booking)
    booking.save
    assert_equal 4, booking.cc_number.length
  end

  def test_r_rated_movie
    booking = bookings(:existing_booking_two)
    booking.save
    assert_equal 1, booking.errors.count

    booking.buyer_age_confirmed = true
    assert booking.valid?
  end

end
