class ClassifiedMessage
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :message, :classified_id

  validates_presence_of :name, :email, :message

  def initialize(attributes = {})
    self.attributes = attributes
  end

  def attributes=(attributes)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def save
    ClassifiedMailer.contact_message(self).deliver if valid?
  end

  def persisted?; false end
end
