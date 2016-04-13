class CategoriaProducto < ActiveRecord::Base
  belongs_to :categorium
  belongs_to :producto
end
