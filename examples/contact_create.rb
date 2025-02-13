#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib/')
require 'messagebird'

# ACCESS_KEY = 'YOUR KEY HERE'
# PHONE_NUMBER = 'YOUR PHONE NUMBER HERE'

unless defined?(ACCESS_KEY)
  puts 'You need to set an ACCESS_KEY constant in this file'
  exit 1
end

unless defined?(PHONE_NUMBER)
  puts 'You need to set an PHONE_NUMBER constant in this file'
  exit 1
end

begin
  # Create a MessageBird client with the specified ACCESS_KEY.
  client = MessageBird::Client.new(ACCESS_KEY)

  # Create a new Contact object.
  contact = client.contact_create(PHONE_NUMBER, firstName: 'Foo', lastName: 'Bar')

  # Print the object information.
  puts
  puts '  Contact           :'
  puts
  puts "    id              : #{contact.id}"
  puts "    href            : #{contact.href}"
  puts "    msisdn          : #{contact.msisdn}"
  puts "    firstName       : #{contact.firstName}"
  puts "    lastName        : #{contact.lastName}"
  puts "    groups          : #{contact.groups.href}" # contact.groups.total_count is also available.
  puts "    messages        : #{contact.messages.href}" # contact.messages.total_count is also available.
  puts "    custom1         : #{contact.custom_details.custom1}"
  puts "    custom2         : #{contact.custom_details.custom2}"
  puts "    custom3         : #{contact.custom_details.custom3}"
  puts "    custom4         : #{contact.custom_details.custom4}"
  puts
rescue MessageBird::ErrorException => e
  puts
  puts 'An error occurred while creating a contact:'
  puts

  e.errors.each do |error|
    puts "  code        : #{error.code}"
    puts "  description : #{error.description}"
    puts "  parameter   : #{error.parameter}"
    puts
  end
end
