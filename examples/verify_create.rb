#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib/')
require 'messagebird'

ACCESS_KEY = ''

unless defined?(ACCESS_KEY)
  puts 'You need to set an ACCESS_KEY constant in this file'
  exit 1
end

begin
  # Create a MessageBird client with the specified ACCESS_KEY.
  client = MessageBird::Client.new(ACCESS_KEY)

  # Generate a new OTP message
  otp = client.verify_create(31_612_345_678, reference: 'MessageBirdReference')

  # Print the object information.
  puts
  puts 'The following information was returned as an OTP object:'
  puts
  puts "  id                  : #{otp.id}"
  puts "  recipient           : #{otp.recipient}"
  puts "  reference           : #{otp.reference}"
  puts "  status              : #{otp.status}"
  puts "  href                : #{otp.href}"
  puts "  created_datetime     : #{otp.created_datetime}"
  puts "  validUntilDatetime  : #{otp.validUntilDatetime}"
  puts
rescue MessageBird::ErrorException => e
  puts
  puts 'An error occured while requesting an OTP object:'
  puts

  e.errors.each do |error|
    puts "  code        : #{error.code}"
    puts "  description : #{error.description}"
    puts "  parameter   : #{error.parameter}"
    puts
  end
end
