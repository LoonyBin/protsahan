require 'spec_helper'

describe ItemsController do
  let(:item) { create :item }
  let(:valid_attributes) { attributes_for :item }

  context "for a visitor" do
    describe "#index" do
      before { get :index }

      it { should assign_to(:items).with([item]) }
      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should_not set_the_flash }
    end

    describe "#show" do
      before { get :show, :id => item.id.to_s }

      it { should assign_to(:item).with(item) }
      it { should respond_with(:success) }
      it { should render_template(:show) }
      it { should_not set_the_flash }
    end

    describe "#new" do
      before { get :new }
      it { should redirect_to(sign_in_path) }
    end

    describe "#edit" do
      before { get :edit, :id => item.id.to_s }
      it { should redirect_to(sign_in_path) }
    end

    describe "#create" do
      before { post :create, :item => valid_attributes }
      it { should redirect_to(sign_in_path) }
    end

    describe "#update" do
      before { put :update, :id => item.id.to_s, :item => { :name => 'updated name'} }
      it { should redirect_to(sign_in_path) }
    end

    describe "#destroy" do
      before { delete :destroy, :id => item.id.to_s }
      it { should redirect_to(sign_in_path) }
    end
  end

  context "for a user" do
    before { sign_in }

    describe "#new" do
      before { get :new }
      it { should deny_access }
      it { should set_the_flash.to("Don't bite more than you can chew!") }
    end

    describe "#edit" do
      before { get :edit, :id => item.id.to_s }
      it { should deny_access }
      it { should set_the_flash.to("Don't bite more than you can chew!") }
    end

    describe "#create" do
      before { post :create, :item => valid_attributes }
      it { should deny_access }
      it { should set_the_flash.to("Don't bite more than you can chew!") }
    end

    describe "#update" do
      before { put :update, :id => item.id.to_s, :item => { :name => 'updated name'} }
      it { should deny_access }
      it { should set_the_flash.to("Don't bite more than you can chew!") }
    end

    describe "#destroy" do
      before { delete :destroy, :id => item.id.to_s }
      it { should deny_access }
      it { should set_the_flash.to("Don't bite more than you can chew!") }
    end

  end
  context "for an admin" do
    before { sign_in_as create(:admin) }

    describe "#new" do
      before { get :new }
      it { should assign_to(:item).with_kind_of(Item) }
    end

    describe "#edit" do
      before { get :edit, :id => item.id.to_s }
      it { should assign_to(:item).with(item) }
    end

    describe "#create" do
      describe "with valid attributes" do
        before { post :create, :item => valid_attributes }
        it "creates a new Item" do
          expect {
            post :create, :item => valid_attributes
          }.to change(Item, :count).by(1)
        end

        it "saves the item" do
          assigns(:item).should be_persisted
        end

        it { should assign_to(:item).with_kind_of(Item) }
        it { should redirect_to(Item.last) }
      end

      describe "with invalid params" do
        before { post :create, :item => {} }
        it { should assign_to(:item).with_kind_of(Item) }
        it { should render_template("new") }
      end
    end

    describe "#update" do
      describe "with valid params" do
        it "updates the requested item" do
          item.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => item.id.to_s, :item => {'these' => 'params'}
        end

        before { put :update, :id => item.id.to_s, :item => { :name => 'updated name' } }

        it { should assign_to(:item).with(item) }
        it { should redirect_to(item) }
      end

      describe "with invalid params" do
        before { put :update, :id => item.id.to_s, :item => { :name => '' } }
        it { should assign_to(:item).with(item) }
        it { should render_template("edit") }
      end
    end

    describe "#destroy" do
      it "destroys the requested item" do
        expect {
          delete :destroy, :id => item.id.to_s
        }.to change(Item, :count).by(-1)
      end

      before { delete :destroy, :id => item.id.to_s }
      it { should redirect_to(items_path) }
    end

  end
end
