require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "with params from factorybot" do
    context '#save' do
      let(:participants_count) { 4 }
      subject(:task) { build(:task_with_participants, participants_count: participants_count) }
       
      it 'is persisted' do
        expect(task.save).to eq true
      end
      
      context 'after save' do
        before(:each) { task.save }
        
        it 'has all associated participants' do
          expect(task.participating_users.count).to eq participants_count
          expect(Participant.count).to eq participants_count
        end
      end
    end
  end

  describe "with params from scratch" do
    let(:owner) {create :user}
    let(:category) {create :category}
    let(:participant_1) {build :participant, :responsible}
    let(:participant_2) {build :participant, :follower}
    
    subject(:task) do 
      described_class.new(
        name: 'Tarea',
        description: 'desc',
        due_date: Date.today + 5.days,
        category: category,
        owner: owner,
        participating_users: [participant_1, participant_2]
      )
    end

    context '#validations data' do
      it "expect to valid data" do
        is_expected.to be_valid
      end
    end

    context "after save" do
        before(:each) { task.save }
        it "expect to persisted data" do
          is_expected.to be_persisted
        end
        it 'has a computed code' do
          expect(task.code).to be_present
        end
    end
    
    context "with due_date in the past" do
      subject { task.tap {|t| t.due_date = Date.today - 1.day } }
      it 'due_date false' do
        is_expected.to_not be_valid
      end
    end
    
  end
  
  

  describe '#mongo validations' do
    context "MongoID spec" do
      it { is_expected.to be_mongoid_document }
    end

    context "timstamps" do
      it { is_expected.to have_timestamps }
    end

    context "columns" do
      it { is_expected.to have_field(:name).of_type(String)}
      it { is_expected.to have_field(:description).of_type(String) }
      it { is_expected.to have_field(:due_date).of_type(Date)}
      it { is_expected.to have_field(:code).of_type(String) }
    end

    context "relations" do
      it { is_expected.to have_many :participating_users }
      it { is_expected.to belong_to(:category) }
      it { is_expected.to belong_to(:owner) }
    end

    context "validations" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:due_date) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_uniqueness_of(:name) }
    end
  end
end
