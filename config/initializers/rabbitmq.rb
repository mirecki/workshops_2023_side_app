# frozen_string_literal: true

require 'bunny'

connection_options =
  {
    host: 'localhost',
    port: '5672',
    vhost: '/',
    username: 'guest',
    password: 'guest'
  }

connection = Bunny.new(connection_options).tap(&:start)
channel = connection.create_channel

book_loans_queue = channel.queue('basic_app_book_loans')
book_loans_queue.bind('basic_app')

book_loans_canceled_queue = channel.queue('basic_app_book_loans_canceled')
book_loans_canceled_queue.bind('basic_app')
