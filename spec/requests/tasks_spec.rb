require 'rails_helper'

RSpec.describe "Tasks endpoint", type: :request do

  describe "index" do
    let(:user){ create :user }
    before(:each) { sign_in user }
    context "index response" do
      it "should return ok" do
        get '/tasks'
        expect(response).to have_http_status(200)
      end
    end
    context "index content" do
      it "should return status code 200" do
        get '/tasks'
        expect(response).to have_http_status(200) 
      end
    end
    context "new task" do
      let(:participant){create :user}
      let(:category){create :category}

      let(:params) do
        {
          "task" => {
            "name"=>"Lavar cuarto",
             "description"=>"cuarto", 
             "due_date"=> Date.today + 5.days, 
             "category_id"=> category.id.to_s, 
             "participating_users_attributes" => {
               "0" => {
                  "user_id"=>participant.id.to_s, 
                  "role"=>"1",
                  "_destroy" => "false"
                }
              }
          }
        }
      end

      describe "Patch /tasks/:id/trigger" do
        let(:participants_count) { 4 }
        subject(:task) do
          build(
                  :task_with_participants, 
                  owner: user,
                  participants_count: participants_count
                )
        end  
        let(:event) { 'start'}
        it 'updates the state', focus: true do
          task.save
          patch trigger_task_path(task, event: event, format: :js)
          expect(task.reload.status).to eq 'in_process' 
        end
      end
      

      it 'create new task and redirect' do
        post '/tasks', params: params
        expect(response).to redirect_to(assigns(:task))
        follow_redirect!
        expect(response).to render_template(:show)
        #expect(response.body).to include()
      end


      it "should return status code 200" do
        get '/tasks/new'
        expect(response).to render_template(:new) 
      end
      
    end
    
    
  end
    
end
