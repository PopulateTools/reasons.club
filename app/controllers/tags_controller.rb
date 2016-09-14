class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.most_used(100)
  end

  def show
    if @tag = ActsAsTaggableOn::Tag.find_by(name: params[:id])
      @issues = Issue.tagged_with(@tag.name)
    end
  end
end
