class Tasks::CreateCode
  def call task, code
    task.update(code: code)
    [true, 'succesful']
  rescue => e
    Rails.logger.error e
    [false, 'fail']
  end
end