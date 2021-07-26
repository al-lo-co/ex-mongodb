require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  
  let(:user){ create :user }
  before(:each) { sign_in user }

=begin
  before do
    driven_by(:rack_test)
  end
=end

  describe 'get /tasks' do
    context "has a correct" do
      it 'title' do
        visit '/tasks'
        expect(page).to have_content 'Lista de tareas'
      end
    end
  end

  describe 'interact with form' do
    #con el ! no espera a que sea invocado el category para ser creado, se crea apenas se ejecuta la prueba
    let!(:category) { create :category }
    let!(:participant) { create :user }
    context "fill form" do
      it 'use of form', js: true do
        visit '/tasks/new'
        within("#new_task") do
          fill_in "task[name]",	with: "sometext"
          fill_in "task[description]",	with: "sometext"
          fill_in "task[due_date]",	with: Date.today + 1.day
          #select category.name, from: 'task[category_id]'
          page.execute_script(
            "document.getElementById('task_category_id').selectize.setValue('#{category.id}')"
          )

          #select participant.email, from: 'task[participating_users_attributes][0][user_id]'
          page.execute_script(
            "document.querySelector('.selectize.user').selectize.setValue('#{participant.id}')"
          )
          #select 'responsible', from: 'task[participating_users_attributes][0][role]'

          page.execute_script(
            "document.querySelector('.selectize.role').selectize.setValue('1')"
          )
          #xpath = '//*id="new_task"]/div[1]/div[4]/div[1]'
          #within(:xpath, xpath) do
          #  select participant.email, from: 'Usuario'
          #  select 'responsible', from: 'Rol'
          #end
          click_button 'Create Task'
        end
        expect(page).to have_content 'Editar nota'
      end
    end
  end
end
