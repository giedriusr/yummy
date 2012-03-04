class OrderMailer < ActionMailer::Base

  default :from => "info@giedriusr.lt"

  def confirmation(order)
    @order = order
    mail(:to => 'giedrius.rim@gmail.com', :subject => 'Order completed!')
  end
end
