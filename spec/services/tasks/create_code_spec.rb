require 'rails_helper'

RSpec.describe Tasks::CreateCode, type: :model do

  let(:participants_count) { 4 }
  let(:task) { build(:task_with_participants, participants_count: participants_count) }

  subject(:service){described_class.new}

  let(:code){ task.create_code }
  describe '#call' do 
    context 'with a valid task' do
      before(:each){ task.save }
      it 'should return success with the code' do
        success, message = service.call task, code
        expect(success).to eq true
        expect(message).to eq 'succesful'
        expect(task.code).to eq code 
      end
    end

  end

end