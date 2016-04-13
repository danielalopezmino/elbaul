class Categorium < ActiveRecord::Base
  has_many :categoria_productos, :dependent => :delete_all
end
