class IngredientiController < ApplicationController
  before_action :set_ingrediente, only: %i[show edit update destroy]

  # GET /ingredienti
  def index
    @ingrediente = Ingrediente.all
  end

  # GET /ingredienti/1
  def show
  end

  # GET /ingredienti/new
  def new
    @ingrediente = Ingrediente.new
  end

  # POST /ingredienti
  def create
    @ingrediente = Ingrediente.new(ingrediente_params)
    if @ingrediente.save
      redirect_to ingredienti_index_path, notice: 'Ingrediente creato con successo.'
    else
      Rails.logger.debug "Errore nel salvataggio: #{@ingrediente.errors.full_messages.join(', ')}"
      render :new
    end
  end

  # GET /ingredienti/1/edit
  def edit
  end

  # PATCH/PUT /ingredienti/1
  def update
    if @ingrediente.update(ingrediente_params)
      redirect_to ingredienti_index_path, notice: 'Ingrediente aggiornato con successo.'
    else
      render :edit
    end
  end


  # DELETE /ingredienti/1
  def destroy
    Rails.logger.debug "Tentativo di eliminare ingrediente con ID: #{params[:id]}"
    if @ingrediente.destroy
      Rails.logger.debug "Ingrediente eliminato con successo."
      redirect_to ingredienti_index_path, notice: 'Ingrediente eliminato con successo.'
    else
      Rails.logger.debug "Errore durante l'eliminazione dell'ingrediente."
      redirect_to ingredienti_index_path, alert: 'Errore durante l\'eliminazione dell\'ingrediente.'
    end
  end

  private

  def set_ingrediente
    @ingrediente = Ingrediente.find(params[:id])
  end

  def ingrediente_params
    params.require(:ingrediente).permit(:nome, :quantita, :giacenza)
  end
end
