class Image < ApplicationRecord
  belongs_to :product
  # validates_format_of :url, :with => %r{\.(png|jpg|jpeg|svg)$}i,:message => "must have a valid file type", multiline: true
end
