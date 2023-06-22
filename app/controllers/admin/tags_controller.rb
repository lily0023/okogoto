class Admin::TagsController < Admin::BaseController
  def index
    @tags = Tag.all.includes(:posts).order(created_at: :asc).page(params[:page]).per(10)
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, flash: { success: t('.success') }
    else
      flash.now[:error] = t('.fail')
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy!
    flash[:success] = t('.success')
    redirect_to admin_tags_path, status: :see_other
  end

  private

  def tag_params
    params.require(:tag).permit(:situation)
  end
end
