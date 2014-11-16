class SearchesController < ApplicationController
  def new
  end

  def create
    @results = search_results["results"]
  end

  private

  def search_limit
    5
  end

  def search_params
    params.slice(:query, :category).merge(per_page: search_limit)
  end

  def search_results
    $zendesk.connection.get("help_center/articles/search.json", search_params).body
  end
end
