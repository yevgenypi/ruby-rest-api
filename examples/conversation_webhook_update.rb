#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib/')
require 'messagebird'

# ACCESS_KEY = ''

unless defined?(ACCESS_KEY)
  puts 'You need to set an ACCESS_KEY constant in this file'
  exit 1
end

begin
  # Create a MessageBird client with the specified ACCESS_KEY.
  client = MessageBird::Client.new(ACCESS_KEY)

  # Update a webhook
  webhook = client.conversation_webhook_update('00000000000000000000000000000000', url: 'https://test.com', events: [MessageBird::Conversation::WEBHOOK_EVENT_MESSAGE_CREATED])

  # Print the object information.
  puts 'The following information was returned as a Webhook object'
  puts "  id                        : #{webhook.id}"
  puts "  events                    : #{webhook.events}"
  puts "  channel_id                 : #{webhook.channel_id}"
  puts "  url                       : #{webhook.url}"
  puts "  status                    : #{webhook.status}"
  puts "  created_datetime           : #{webhook.created_datetime}"
  puts "  updated_datetime           : #{webhook.updated_datetime}"
rescue MessageBird::ErrorException => e
  puts
  puts 'An error occured while creating a conversation:'
  puts

  e.errors.each do |error|
    puts "  code        : #{error.code}"
    puts "  description : #{error.description}"
    puts "  parameter   : #{error.parameter}"
    puts
  end
end
