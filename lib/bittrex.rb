require 'bittrex/version'
require 'logger'

module Bittrex
  autoload :Market,        'bittrex/market'
  autoload :Client,        'bittrex/client'
  autoload :Clientable,    'bittrex/clientable'
  autoload :Configuration, 'bittrex/configuration'
  autoload :Currency,      'bittrex/currency'
  autoload :Deposit,       'bittrex/deposit'
  autoload :Order,         'bittrex/order'
  autoload :Quote,         'bittrex/quote'
  autoload :Summary,       'bittrex/summary'
  autoload :Wallet,        'bittrex/wallet'
  autoload :Withdrawl,     'bittrex/withdrawl'
  autoload :Api,           'bittrex/api'
  autoload :WebSocket,     'bittrex/websocket'

  def self.client
    @client ||= Client.new(configuration.auth)
  end

  def self.config
    yield configuration
    @client = Client.new(configuration.auth)
  end

  def self.configuration
    Configuration.instance
  end

  def self.root
    File.expand_path('../..', __FILE__)
  end

  def self.stdout_logger
    (@@stdout_logger ||= Logger.new($stdout))
  end
end
