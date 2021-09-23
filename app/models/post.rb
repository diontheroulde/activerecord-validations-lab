class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Non-Fiction Fiction) }
  validate :is_clickbait?


  CLICK_BAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ] 

  def is_clickbait?
   if CLICK_BAIT.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end