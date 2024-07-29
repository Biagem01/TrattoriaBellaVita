class ClientiController < ApplicationController
    before_action :set_cliente, only: %i[show edit update destroy]
  
    # GET /clienti
    # GET /clienti.json
    def index
      @cliente = Cliente.all
    end
  
    # GET /clienti/1
    # GET /clienti/1.json
    def show
    end
  
    # GET /clienti/new
    def new
      @cliente = Cliente.new
    end
  
    # GET /clienti/1/edit
    def edit
    end
  
    # POST /clienti
    # POST /clienti.json
    def create
      @cliente = Cliente.new(cliente_params)
      if @cliente.save
        redirect_to clienti_index_path, notice: 'Cliente creato con successo.'
      else
        flash[:alert] = @cliente.errors.full_messages.join(', ')
        redirect_to new_clienti_path
      end
    end
    
    # PATCH/PUT /clienti/1
    def update
      if @cliente.update(cliente_params)
        redirect_to clienti_index_path, notice: 'Cliente aggiornato con successo.'
      else
        render :edit
      end
    end
  
  
    # DELETE /clienti/1
    # DELETE /clienti/1.json
    def destroy
      Rails.logger.debug "Tentativo di eliminare ingrediente con ID: #{params[:id]}"
      if @cliente.destroy
        Rails.logger.debug "Ingrediente eliminato con successo."
        redirect_to clienti_index_path, notice: 'Ingrediente eliminato con successo.'
      else
        Rails.logger.debug "Errore durante l'eliminazione dell'ingrediente."
        redirect_to clienti_index_path, alert: 'Errore durante l\'eliminazione dell\'ingrediente.'
      end
    end
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cliente
        @cliente = Cliente.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def cliente_params
        params.require(:cliente).permit(:nome, :email, :telefono, :indirizzo)
      end
  end
  