class TestMailer < ApplicationMailer
  def test
    mail(to: "brianchan337@gmail.com", subject: "test")
  end
end
