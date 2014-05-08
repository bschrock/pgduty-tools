#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

api_key = ENV['PGDuty_API_KEY']
pgduty_org = ENV['PGDuty_ORG']

url = URI.parse("https://#{pgduty_org}.pagerduty.com/api/v1/incidents?sort_by=incident_number:desc&status=triggered")

response = Net::HTTP.start( url.host, url.port, :use_ssl => 'https') do |http|
  request = Net::HTTP::Get.new(url)
  request.add_field('Content-type', 'application/json')
  request.add_field('Authorization', "Token token=#{api_key}")
  response = http.request(request)
end

run_time = response.to_hash['x-runtime']
cookie = response.to_hash['set-cookie']
status = response.to_hash['status']

puts "## Status: #{status}  Run Time: #{run_time} ##"

incidents = JSON.parse(response.body)
incidents['incidents'].each() do |event|
  id = event['incident_number']
  severity = event['service']['name']
  description = event['trigger_summary_data']['description']
  puts "#{id}\t#{severity}\t\t#{description}"
end  

exit 0
