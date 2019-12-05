# frozen_string_literal: true

require 'messagebird/base'

module MessageBird
  class Error < MessageBird::Base
    attr_accessor :code, :description, :parameter
  end
end
