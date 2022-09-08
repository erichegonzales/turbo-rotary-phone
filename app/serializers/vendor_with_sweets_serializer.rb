class VendorWithSweetsSerializer < ActiveModel::Serializer
  attributes :id, :vendor_id, :sweet_id, :name, :price
  has_many :sweets
  has_many :vendor_sweets
end
