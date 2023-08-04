

#class DashboardController < ApplicationController
  #def show
   # @user = current_user
    #@posts = @user.posts.order(created_at: :desc).limit(10)
    #@chart_data = @user.posts.group_by { |post| post.name } # 種目名をキーにしてデータをグループ化
  
    #@chart_data.transform_values! do |posts|
      #posts.sum { |post| post.set.to_f } # 各種目の回数を合計
    #end
  #end
#end
class DashboardController < ApplicationController
  def show
    @user = current_user
    @posts = @user.posts.order(created_at: :desc).limit(10)
    @chart_data = @user.posts.group_by { |post| post.created_at.to_date }
                             .transform_values { |posts| posts.map { |post| { name: post.name, set: post.set.to_f } } }
  end
end
