class RelationshipsController < ApplicationController
 # before_action :logged_in_user

  def create
  	relationship = Relationship.new(follower_id: current_user.id, followed_id: params[:user_id])
  	relationship.save
  	redirect_to users_path
  	# follow = current_user.active_relationships.build(follower_id: params[:user_id])
  	# follow.save
  	# redirect_to users_path
  end

  def destroy
  	relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
  	relationship.destroy
  	redirect_to users_path
  	# user = Relationship.find(params[:id]).followed
  	# current_user.unfollow(user)
  	# redirect_to user_path(user)

  	# follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
  	# follow.destroy
  	# redirect_to users_path
  end
end
