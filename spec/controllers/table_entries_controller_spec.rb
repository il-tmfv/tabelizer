require 'rails_helper'
require 'rails_helper'

RSpec.describe TableEntriesController, type: :controller do
  before(:each) do
    sign_in FactoryGirl.create(:user)
  end

  it "renders index template" do
    get :index
    expect(response).to render_template(:index)
  end

  it "deletes table entry" do
    table_entry = FactoryGirl.create(:table_entry)
    expect { 
      delete :destroy, id: table_entry.id
    }.to change(TableEntry, :count).by(-1)
  end

  it "shows edit table_entry form" do
    table_entry = FactoryGirl.create(:table_entry)
    get :edit, id: table_entry.id
    expect(response).to render_template(:edit)
  end

  it "redirects to index when updates" do
    table_entry = FactoryGirl.create(:table_entry)
    put :update, id: table_entry.id, table_entry: FactoryGirl.attributes_for(:table_entry), comment: 'New comment'
    expect(response).to redirect_to(action: :index)
  end
    
end
