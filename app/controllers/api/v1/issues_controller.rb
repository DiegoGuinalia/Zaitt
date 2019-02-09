class Api::V1::IssuesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  
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
    parsed_request = JSON.parse(request.body.read)
    
    issue = Issue.new(
      action: parsed_request["action"],
      repository_id: parsed_request["issue"]["id"],
      repository_name: parsed_request["repository"]["name"],
      owner_name: parsed_request["repository"]["owner"]["login"]
    )
    
    render json: { data: "#{issue.to_json}" }, status: issue.save ? 201 : 400
  end
end