require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  it "handles a missing project correctly" do 
    get :show, id: "no-here"

    expect(response).to redirect_to(projects_path)

    message = "The project you were looking for could not be found."
    expect(flash: { notice: message })
  end
end
