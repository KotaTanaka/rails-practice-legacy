####################
# 管理API レビューコントローラー
####################
class Admin::ReviewsController < Admin::ApplicationController
  # レビュー一覧取得
  # GET /admin/reviews
  def index
    @reviews = Review.all.order(created_at: :desc)
    render("reviews/index")
  end

  # レビューステータス変更
  # PUT /admin/reviews/:id
  def update
    @review = Review.find_by(id: params[:id])
    # TODO ステータス変更処理
    @review.save
    redirect_to("/admin/reviews")
  end

  # レビュー削除
  # DELETE /admin/reviews/:id
  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    flash[:notice] = "レビューを削除しました"
    redirect_to("/admin/reviews")
  end
end
