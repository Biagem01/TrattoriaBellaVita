class OrdiniController < ApplicationController
  def index
    @ordini = Ordine.includes(:cliente, ordine_ricettum: :ricetta).all
  end

  def show
    @ordine = Ordine.find(params[:id])
  end

  def new
    @ordine = Ordine.new
    @clienti = Cliente.all
    @ricette = Ricetta.all
    @ordine.ordine_ricettum.build
  end

  def create
    @ordine = Ordine.new(ordine_params)
    if @ordine.save
      redirect_to ordini_index_path, notice: 'Ordine creato con successo.'
    else
      @clienti = Cliente.all
      @ricette = Ricetta.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ordine = Ordine.find(params[:id])
    @clienti = Cliente.all
    @ricette = Ricetta.all
    @ordine.ordine_ricettum.build if @ordine.ordine_ricettum.empty?
  end

  def update
    @ordine = Ordine.find(params[:id])
    if @ordine.update(ordine_params)
      redirect_to ordini_index_path, notice: 'Ordine aggiornato con successo.'
    else
      @clienti = Cliente.all
      @ricette = Ricetta.all
      render :edit
    end
  end

  def destroy
    @ordine = Ordine.find(params[:id])
    @ordine.destroy
    redirect_to ordini_path, notice: 'Ordine eliminato con successo.'
  end

  private

  def ordine_params
    params.require(:ordine).permit(:cliente_id, ordine_ricettum_attributes: [:id, :ricetta_id, :quantita, :_destroy])
  end
end
