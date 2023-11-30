require 'dotenv'
require "pager_duty/connection"

Dotenv.load

pagerduty = PagerDuty::Connection.new(ENV['PAGERDUTY_TOKEN'], url: 'https://api.pagerduty.com/')

response = pagerduty.get('oncalls')

response.oncalls.each do |oncall|
  p oncall.user.summary if oncall.escalation_policy.id == ENV['ONCALL_ID'] && oncall.escalation_level == 1
end
