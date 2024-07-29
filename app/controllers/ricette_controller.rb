class RicetteController < ApplicationController
  def index
    @ricette = Ricetta.includes(:ingredienti_ricettum => :ingrediente).all
  end

  def show
    @ricetta = Ricetta.find(params[:id])
  end

  def new
    @ricetta = Ricetta.new
    @ingredienti = Ingrediente.all
    @ricetta.ingredienti_ricettum.build
  end

  def create
    @ricetta = Ricetta.new(ricetta_params)
    if @ricetta.save
      redirect_to ricette_index_path, notice: 'Ricetta creata con successo.'
    else
      @ingredienti = Ingrediente.all
      render :new
    end
  end

  def edit
    @ricetta = Ricetta.find(params[:id])
    @ingredienti = Ingrediente.all
    @ricetta.ingredienti_ricettum.build if @ricetta.ingredienti_ricettum.empty?
  end

  def update
    @ricetta = Ricetta.find(params[:id])
    if @ricetta.update(ricetta_params)
      redirect_to ricette_index_path, notice: 'Ricetta aggiornata con successo.'
    else
      @ingredienti = Ingrediente.all
      render :edit
    end
  end

  def destroy
    @ricetta = Ricetta.find(params[:id])
    @ricetta.destroy
    redirect_to ricette_path, notice: 'Ricetta eliminata con successo.'
  end

  private

  def ricetta_params
    params.require(:ricetta).permit(:nome, ingredienti_ricettum_attributes: [:id, :ingrediente_id, :quantita, :_destroy])
  end
end
