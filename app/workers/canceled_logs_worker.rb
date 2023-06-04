class LogsWorker
    include Sneakers::Worker
  
    from_queue 'basic_app_book_loans',
    exchange: 'basic_app', exchange_type: :topic, routing_key: 'basic_app.book_loans_canceled'
  
    def work(attributes)
      logs_data = JSON.parse(attributes)['message']
  
      ::Log.create(user_id: logs_data['id'], data: logs_data)
    end
  end