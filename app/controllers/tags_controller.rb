class TagsController < ApplicationController

  def index
    @tags = if params[:q]
              ActsAsTaggableOn::Tag.where("name like '#{escape_search_query(params[:q])}%'").all
            else
              ActsAsTaggableOn::Tag.most_used(100)
            end

    respond_to do |format|
      format.html
      format.json do
        render json: @tags.to_json
      end
    end
  end

  def show
    if @tag = ActsAsTaggableOn::Tag.find_by(name: params[:id])
      @issues = Issue.tagged_with(@tag.name)
    end
  end

  private

  def escape_search_query(q)
    q.gsub(/\\/, '\&\&').gsub(/'/, "''")
  end
end
