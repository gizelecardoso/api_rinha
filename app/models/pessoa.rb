class Pessoa < ApplicationRecord
  validates :apelido, presence: true
  validates :nome, presence: true
  validates :nascimento, presence: true

  validates :apelido, length: { maximum: 32 }
  validates :nome, length: { maximum: 100 }

  validates :apelido, uniqueness: true

  validates :nascimento, format: { with: /[0-9]{4}-[0-9]{2}-[0-9]{2}/}

  validate :validate_stack

  private

  def validate_stack
    lista = stack.map { |single| single.is_a?(String) && single.length <= 32 }

    errors.add(:stack, "invalid item of stack") if lista.include?(false)
  end
end
