class Tasks::SendEmail
  def call task
    (task.participants + [task.owener]).each do |user|
      ParticipantMailer.with(user: user, task: task).new_task_email.deliver!
    end
    [true, 'succesful']
  end

  rescue => expect
    Rails.logger.error e
    [false, 'fail']
  end
end