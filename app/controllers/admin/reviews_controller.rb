####################
# 管理API レビューコントローラー
####################
class Admin::ReviewsController < Admin::ApplicationController
  include ValidateCondition
  include RenderReviewsResponse

  # レビュー一覧取得
  # GET /admin/reviews
  # GET /admin/reviews.html
  def index
    @reviews = Review.all.order(created_at: :desc)
      .limit(validate_limit(params[:limit]))
      .offset(validate_offset(params[:offset]))
      .order(created_at: validate_sort(params[:sort]))

    respond_to do |format|
      format.json { render_review_list(Review.count, @reviews) }
      format.html { render("reviews/index") }
    end
  end

  # レビューステータス変更
  # PUT /admin/reviews/:id
  # PUT /admin/reviews/:id.html
  def update
    @review = Review.find_by(id: params[:id])

    respond_to do |format|
      if @review.update(publish_status: params[:review][:publish_status])
        format.json { render_success(:review, :update, @review.id) }
        format.html {
          flash[:notice] = "レビューステータスを更新しました"
          redirect_to("/admin/reviews.html")
        }
      else
        format.json
        format.html render("reviews/index")
      end
    end
  end

  # レビュー削除
  # DELETE /admin/reviews/:id
  # DELETE /admin/reviews/:id.html
  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy

    respond_to do |format|
      format.json { render_success(:review, :delete, @review.id) }
      format.html {
        flash[:notice] = "レビューを削除しました"
        redirect_to("/admin/reviews.html")
      }
    end
  end
end
