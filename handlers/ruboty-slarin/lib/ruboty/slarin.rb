require 'ruboty/slarin/version'
require 'ruboty/slarin/handlers/account_info'

module Ruboty
  module Slarin
    def self.find_emails(str)
      str.scan(/([a-z0-9]+[\w\-\.]+@([\w\-]+\.)+[a-z]+)[\W\Z]?/i).map(&:first).uniq
    end
  end
end
