class Transaction < ApplicationRecord
  validate :transaction_time_valid
  validates :value, numericality: { greater_than: 0 }

  private

  def transaction_time_valid
    if transaction_time > Time.now
      errors.add(:transaction_time)
    end
  end
end
