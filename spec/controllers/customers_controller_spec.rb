require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
    it "renders index template" do
        get :index
        expect(response).to render_template(:index)
    end

    it "deletes customer" do
        customer = FactoryGirl.create(:customer)
        expect { 
            delete :destroy, id: customer.id
        }.to change(Customer, :count).by(-1)
    end

    it "creates customer" do
        expect {
            post :create, customer: FactoryGirl.attributes_for(:customer)
        }.to change(Customer, :count).by(1)
    end

    it "creates customer and redirects to index" do
        post :create, customer: FactoryGirl.attributes_for(:customer)
        expect(response).to redirect_to(action: :index)
    end

    it "shows edit customer form" do
        customer = FactoryGirl.create(:customer)
        get :edit, id: customer.id
        expect(response).to render_template(:edit)
    end

    it "redirects to index when updates" do
        customer = FactoryGirl.create(:customer)
        put :update, id: customer.id, customer: FactoryGirl.attributes_for(:customer), comment: 'New comment'
        expect(response).to redirect_to(action: :index)
    end
    
    it "shows customer" do
        customer = FactoryGirl.create(:customer)
        get :show, id: customer.id
        expect(:response).to render_template(:show)
    end
end
