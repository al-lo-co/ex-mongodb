require 'rails_helper'

RSpec.describe Tasks::TriggerEvent, type: :model do

  let(:participants_count) { 4 }
  let(:task) { build(:task_with_participants, participants_count: participants_count) }

  subject(:service){described_class.new}

  let(:event){ 'start' }
  describe '#call' do 
    context 'with a valid task' do
      before(:each){ task.save }
      it 'should return success' do
        success, message = service.call task, event
        expect(success).to eq true
        expect(message).to eq 'succesful'
        expect(task.status).to eq 'in_process'
        expect(task.transitions.count).to eq 1
      end
    end

  end

end