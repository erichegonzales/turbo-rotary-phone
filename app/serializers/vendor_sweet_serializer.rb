class VendorSweetSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  # has_one :vendor
  # has_one :sweet

  def name
    "#{self.object.sweet.name}"
  end
end
