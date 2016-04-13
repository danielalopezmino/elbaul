class CategoriaProductosController < AdminController
  before_action :set_categoria_producto, only: [:show, :edit, :update, :destroy]

  # GET /categoria_productos
  # GET /categoria_productos.json
  def index
    @categoria_productos = CategoriaProducto.order(:categorium_id)
  end

  # GET /categoria_productos/1
  # GET /categoria_productos/1.json
  def show
  end

  # GET /categoria_productos/new
  def new
    @categoria_producto = CategoriaProducto.new
  end

  # GET /categoria_productos/1/edit
  def edit
  end

  # POST /categoria_productos
  # POST /categoria_productos.json
  def create
    @categoria_producto = CategoriaProducto.new(categoria_producto_params)

    respond_to do |format|
      if @categoria_producto.save
        format.html { redirect_to @categoria_producto, notice: 'Categoria producto was successfully created.' }
        format.json { render :show, status: :created, location: @categoria_producto }
      else
        format.html { render :new }
        format.json { render json: @categoria_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria_productos/1
  # PATCH/PUT /categoria_productos/1.json
  def update
    respond_to do |format|
      if @categoria_producto.update(categoria_producto_params)
        format.html { redirect_to @categoria_producto, notice: 'Categoria producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoria_producto }
      else
        format.html { render :edit }
        format.json { render json: @categoria_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria_productos/1
  # DELETE /categoria_productos/1.json
  def destroy
    @categoria_producto.destroy
    respond_to do |format|
      format.html { redirect_to categoria_productos_url, notice: 'Categoria producto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria_producto
      @categoria_producto = CategoriaProducto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoria_producto_params
      params.require(:categoria_producto).permit(:categorium_id, :producto_id)
    end
end
