require 'rubygems'
require 'twilio-ruby'

class SMS
  def self.send_sms(message)
    account_sid = TWILIO_ACCOUNT_SID
    auth_token = TWILIO_AUTH_TOKEN
    client = Twilio::REST::Client.new account_sid, auth_token

    from = '+447533005208' # Your Twilio number
    to = '+447445367881' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
end
