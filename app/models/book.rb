class Book < ApplicationRecord
      has_one_attached :book
     belongs_to :user
      validates :body, presence: true
      validates :title,  presence: true
      validates :body, length: {maximum: 200 }

      
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end