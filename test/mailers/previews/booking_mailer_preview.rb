# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  @booking = Booking.last

  def receipt
    BookingMailer.receipt(@booking)
  end

end
