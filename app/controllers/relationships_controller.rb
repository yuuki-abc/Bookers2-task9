class RelationshipsController < ApplicationController

  def create

    relationships = Relationship.new(follower: current_user)
    relationships.followed = User.find(params[:user_id])
    if (relationships.follower.id == current_user.id) \
        and (relationships.follower.id != relationships.followed.id)
      relationships.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to books_path
    end

  end

  def destroy
    user = User.find(params[:user_id])# 質問 なぜparams[:id]じゃとれないのか？ そもそもparamsとは？
    relationships = Relationship.find_by(followed: user, follower: current_user)
    if relationships
      relationships.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

end