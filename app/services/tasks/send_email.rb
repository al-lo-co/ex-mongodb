class Tasks::SendEmail
  def call task
    binding.pry
    (task.participants + [task.owner]).each do |user|
      ParticipantMailer.with(user: user, task: task).new_task_email.deliver!
      binding.pry
    end
    [true, 'succesful']
  rescue => e
    Rails.logger.error e
    [false, 'fail']
  end
  
end