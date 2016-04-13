class Producto < ActiveRecord::Base
  has_many :fotos, :dependent => :delete_all
  has_many :categoria_productos, :dependent => :delete_all
  has_many :categoria, :through => :categoria_productos
end
