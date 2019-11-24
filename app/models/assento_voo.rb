class AssentoVoo < ApplicationRecord
  belongs_to :voo
  belongs_to :assento
  belongs_to :passageiro
end
