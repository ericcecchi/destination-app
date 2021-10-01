# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'eric.cecchi@gmail.com'
  layout 'mailer'
end
