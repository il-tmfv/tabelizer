require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
    it "renders index template" do
        get :index
        expect(response).to render_template(:index)
    end

    it "deletes project" do
        project = FactoryGirl.create(:project)
        expect { 
            delete :destroy, id: project.id
        }.to change(Project, :count).by(-1)
    end

   it "shows edit project form" do
        project = FactoryGirl.create(:project)
        get :edit, id: project.id
        expect(response).to render_template(:edit)
    end

    it "redirects to index when updates" do
        project = FactoryGirl.create(:project)
        put :update, id: project.id, project: FactoryGirl.attributes_for(:project), comment: 'New comment'
        expect(response).to redirect_to(action: :index)
    end
    
    it "shows project" do
        project = FactoryGirl.create(:project)
        get :show, id: project.id
        expect(:response).to render_template(:show)
    end
end
