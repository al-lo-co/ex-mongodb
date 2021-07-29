require 'rails_helper'

RSpec.describe Tasks::SendEmail, type: :model do

  let(:participants_count) { 4 }
  let(:task) { build(:task_with_participants, participants_count: participants_count) }

  subject(:service){described_class.new}
  describe '#call' do 
    context 'with a valid task' do
      before(:each){ task.save }
      it 'should return success' do
        success, message = service.call task
        expect(success).to eq true
        expect(message).to eq 'succesful'
      end
    end

    context 'with a valid task' do
      it 'should return success' do
        success, message = service.call nil
        expect(success).to eq false
        expect(message).to eq 'fail'
      end
    end
  end

end