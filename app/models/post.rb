class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :click_bait?

  def click_bait?
    baits = [/Won't Believe/i, /Secret/i, /Guess/i, /Top [0-9]*/i]
    if baits.none? { |bait| bait.match title }
      errors.add(:title, "Title is not click bait!")
    end
  end

end
