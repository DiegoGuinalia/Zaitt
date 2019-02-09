class IssuesController < ApplicationController
  
  def index
    @issues = Issue.order(:created_at)
  end
  
  def show
    @issue = Issue.find(params[:id])
  end

  def list_page
  end
  
end