require 'spec_helper'

describe ProjectsController do

  let(:user) { FactoryGirl.create(:user) }

  context "standard users" do

    before { sign_in(user) }

    { new: :get,
      create: :post,
      edit: :get,
      update: :put,
    destroy: :delete }.each do |action, method|
      xit "cannot access the #{action} action" do
        sign_in(user)
        send(method, action, :id => FactoryGirl.create(:project))
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eql("You must be an admin to do that")
      end
    end
  end

  context "missing projects" do

    xit "displays an error for a missing project" do
      get :show, id: "not-here"
      expect(response).to redirect_to(projects_path)
      message = "The project you were looking for could not be found."
      expect(flash[:alert]).to eql(message)
    end
  end

end
