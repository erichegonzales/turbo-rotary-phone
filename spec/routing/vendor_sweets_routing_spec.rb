require "rails_helper"

RSpec.describe VendorSweetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/vendor_sweets").to route_to("vendor_sweets#index")
    end

    it "routes to #show" do
      expect(get: "/vendor_sweets/1").to route_to("vendor_sweets#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/vendor_sweets").to route_to("vendor_sweets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/vendor_sweets/1").to route_to("vendor_sweets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/vendor_sweets/1").to route_to("vendor_sweets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/vendor_sweets/1").to route_to("vendor_sweets#destroy", id: "1")
    end
  end
end
