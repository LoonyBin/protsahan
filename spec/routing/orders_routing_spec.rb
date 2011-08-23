require "spec_helper"

describe OrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/orders").should route_to("orders#index")
    end

    it "routes to #new" do
      get("/items/1/orders/new").should route_to("orders#new", :item_id => "1")
    end

    it "routes to #show" do
      get("/orders/1").should route_to("orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/orders/1/edit").should route_to("orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/items/1/orders").should route_to("orders#create", :item_id => "1")
    end

    it "routes to #update" do
      put("/orders/1").should route_to("orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/orders/1").should route_to("orders#destroy", :id => "1")
    end

  end
end
