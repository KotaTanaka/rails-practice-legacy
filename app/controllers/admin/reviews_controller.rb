####################
# 管理API レビューコントローラー
####################
class Admin::ReviewsController < Admin::ApplicationController
  # レビュー一覧取得
  # GET /admin/reviews
  def index
    @reviews = Review.all.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @reviews }
      format.html { render("reviews/index") }
    end
  end

  # レビューステータス変更
  # PUT /admin/reviews/:id
  def update
    @review = Review.find_by(id: params[:id])
    # TODO ステータス変更処理
    @review.save

    respond_to do |format|
      format.json
      format.html {
        flash[:notice] = "レビューステータスを更新しました"
        redirect_to("/admin/reviews.html")
      }
    end
  end

  # レビュー削除
  # DELETE /admin/reviews/:id
  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy

    respond_to do |format|
      format.json
      format.html {
        flash[:notice] = "レビューを削除しました"
        redirect_to("/admin/reviews.html")
      }
    end
  end
end
