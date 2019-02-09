class Api::V1::IssuesController < Api::V1::BaseController
 
  def index
    issues = Issue.all.order(:created_at)
    render json: issues.to_json(:only => [
      :id, 
      :action,
      :repository_id,
      :repository_name,
      :owner_name,
      :created_at,
      :updated_at
    ])
  end
  
  def new
    
  end
  
  def create
  end
    
end