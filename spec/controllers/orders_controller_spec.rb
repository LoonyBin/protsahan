require 'spec_helper'

describe OrdersController do
  let(:order) { create :order }
  let(:valid_attributes) { attributes_for :order }

  context "for a visitor" do
    describe "#index" do
      before { get :index }
      it { should redirect_to(sign_in_path) }
    end

    describe "#show" do
      before { get :show, :id => order.id.to_s }
      it { should redirect_to(sign_in_path) }
    end

    describe "#edit" do
      before { get :edit, :id => order.id.to_s }
      it { should redirect_to(sign_in_path) }
    end

    describe "#update" do
      before { put :update, :id => order.id.to_s, :order => { :name => 'updated name'} }
      it { should redirect_to(sign_in_path) }
    end

    describe "#destroy" do
      before { delete :destroy, :id => order.id.to_s }
      it { should redirect_to(sign_in_path) }
    end
  end

  context "for a user" do
    let (:user) { create :user }
    let (:own_order) { create :order, :user => user }
    before { sign_in_as user }

    describe "#index" do
      before { get :index }
      it { should assign_to(:orders).with([own_order]) }
      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should_not set_the_flash }
    end

    describe "#show own order" do
      before { get :show, :id => own_order.id.to_s }
      it { should assign_to(:order).with(own_order) }
      it { should respond_with(:success) }
      it { should render_template(:show) }
      it { should_not set_the_flash }
    end

    describe "#show other order" do
      it "should deny_access" do
       expect { get :show, :id => order.id.to_s }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe "#edit" do
      before { get :edit, :id => own_order.id.to_s }
      it { should deny_access }
      it { should set_the_flash.to("Don't bite more than you can chew!") }
    end

    describe "#update" do
      before { put :update, :id => own_order.id.to_s, :order => { :name => 'updated name'} }
      it { should deny_access }
      it { should set_the_flash.to("Don't bite more than you can chew!") }
    end

    describe "#destroy" do
      before { delete :destroy, :id => own_order.id.to_s }
      it { should deny_access }
      it { should set_the_flash.to("Don't bite more than you can chew!") }
    end

  end
  context "for an admin" do
    before { sign_in_as create(:admin) }

    describe "#edit" do
      before { get :edit, :id => order.id.to_s }
      it { should assign_to(:order).with(order) }
    end

    describe "#update" do
      describe "with valid params" do
        it "updates the requested order" do
          order.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => order.id.to_s, :order => {'these' => 'params'}
        end

        before { put :update, :id => order.id.to_s, :order => { :name => 'updated name' } }

        it { should assign_to(:order).with(order) }
        it { should redirect_to(order) }
      end

      describe "with invalid params" do
        before { put :update, :id => order.id.to_s, :order => { :name => '' } }
        it { should assign_to(:order).with(order) }
        it { should render_template("edit") }
      end
    end

    describe "#destroy" do
      it "destroys the requested order" do
        expect {
          delete :destroy, :id => order.id.to_s
        }.to change(Order, :count).by(-1)
      end

      before { delete :destroy, :id => order.id.to_s }
      it { should redirect_to(orders_path) }
    end

  end
end
