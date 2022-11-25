class Chef < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :cuisine, :details ],
  associated_against: {
    user: [ :first_name ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
