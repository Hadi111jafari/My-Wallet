class Expense < ApplicationRecord
    belongs_to :user
    has_many :group_expenses, dependent: :destroy
    has_many :groups, through: :group_expense

    validates :name, presence: true
    validates :amount, presence: true, numericality: { greater_than: 0 }
end
