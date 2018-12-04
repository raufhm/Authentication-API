class Province < ApplicationRecord
    has_many :regional
    has_many :kecamatan, through: :regional
end
