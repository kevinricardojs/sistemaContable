class TipoDeGasto < ActiveRecord::Base
	has_many :compras

	validates :nombre, presence: true, uniqueness: { case_sensitive: true, message:" repetido, ya existe esta cuenta" }
end
