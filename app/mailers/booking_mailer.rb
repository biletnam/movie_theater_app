class BookingMailer < ApplicationMailer

  def receipt(booking)
    @booking = booking
    mail(to: booking.email, subject: "Enjoy the movie!")
  end
end
