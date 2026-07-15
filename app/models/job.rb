class Job < ApplicationRecord
  belongs_to :company
  has_many :applicants, dependent: :destroy
  belongs_to :job
end
