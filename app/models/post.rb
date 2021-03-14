class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait

    def is_clickbait
        if title.present?
            if !(title.include?("Won't Believe") || title.include?("Secret") || title.match(/\ATop \d*/) || title.include?("Guess"))
                errors.add(:title, "must be clickbait!")
            end
        end
    end
end
