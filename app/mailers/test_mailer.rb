class TestMailer < ApplicationMailer
  default from: "contact@ai4good.app"
  def test
    mail(to: "brianchan337@gmail.com", subject: "test")
  end
end
