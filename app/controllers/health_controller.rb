class HealthController < ApplicationController
  def health
    #rails g factory_bot:model user email:string name:string auth:integer 
    @ok = {api: 'OK'}
    render json: @ok, response: :ok
  end
end