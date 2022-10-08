class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    if params[:query].present?
      sql_query = "area LIKE :query OR city LIKE :query"
      @places = Place.where(sql_query, query: "%#{params[:query]}%")
      @places = Place.first
    else
      @places = Place.all
    end
  end
end
