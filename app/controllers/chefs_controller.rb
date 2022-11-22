class ChefsController < ApplicationController
before_action :set_chef, only: [:show, :edit, :update, :destroy]

  def index
    @chefs = Chef.all
  end

  # def show

  # end

  # def new
  # end

  # def create
  # end

  # def destroy
  # end

  # private



end
