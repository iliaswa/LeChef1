class Chef < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_cuisine_and_details,
  against: [ :cuisine, :details ],
  using: {
    tsearch: { prefix: true }
  }
end
