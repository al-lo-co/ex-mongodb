class Tasks::TriggerEvent
  def call task, event
    task.send "#{event}!"
    #binding.pry
    [true, 'succesful']
  rescue => e
    Rails.logger.error e
    [false, 'fail']
  end
  
end