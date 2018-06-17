class Event < ApplicationRecord
  validates :name,
            :description,
            :start_date,
            :finish_date,
            :all_tags, presence: true
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy
  has_attached_file :photo, 
                    styles: {
                      medium: "355x266>",
                      large: "802.5x535" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).events
  end
end
