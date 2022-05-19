class ComicsController < ApplicationController
  before_action :set_comic, only: %i[ show edit update destroy ]

  # GET /comics or /comics.json
  def index
    @comics = Comic.all
    @comics = Comic.page(params[:page]).reverse_order

  end

  # GET /comics/1 or /comics/1.json
  def show
     @comic = Comic.find(params[:id])
     @post_comment = PostComment.new
  end

  # GET /comics/new
  def new
    @comic = Comic.new
  end

  # GET /comics/1/edit
  def edit
    @comic = Comic.find(params[:id])
    if @comic.user == current_user
      render :edit
    else
      redirect_to comics_path
    end
  end

  # POST /comics or /comics.json
  def create
    @comic = Comic.new(comic_params)
    @comic.user_id = current_user.id
    respond_to do |format|
      if @comic.save
        format.html { redirect_to comic_url(@comic)}
        format.json { render :show, status: :created, location: @comic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comics/1 or /comics/1.json
  def update
    respond_to do |format|
      if @comic.update(comic_params)
        format.html { redirect_to comic_url(@comic), notice: "Comic was successfully updated." }
        format.json { render :show, status: :ok, location: @comic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comics/1 or /comics/1.json
  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    if @comic.user == current_user
       redirect_to comics_path
    else
       redirect_to comics_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comic_params
      params.require(:comic).permit(:title, :body, :user_id, :image, :evaluation, :tag_list)
    end

    private
    def sort_params
      params.permit(:sort)
    end
end
