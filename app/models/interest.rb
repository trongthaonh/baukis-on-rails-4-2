class Interest < ActiveRecord::Base
  has_many :customer_interests, autosave: true
  has_many :customers, through: :customer_interests
  alias_attribute :interest_id, :id

  attr_reader :checked

  validates :title, presence: true, uniqueness: true, length: { maximum: 8, allow_blank: false }

  before_destroy :confirm_destroy_action
  before_save :confirm_savable

  protected
    def confirm_destroy_action
      # Only allow delete action when interests records number greater than 2
      if Interest.count > 2 && self.deletable
        self.customer_interests.delete_all
      end
    end

    def confirm_savable
      if !self.new_record?
        self.deletable
      end
    end
end
