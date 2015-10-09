class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:vote_up, :vote_down]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote_up
    @vote = Vote.find_or_create_by(user_id: current_user.id, link_id: params[:link_id])
    @link = Link.find(params[:link_id])
    if @vote.casted == true && @vote.neg_vote == true
      @link.num_votes += 1
      @vote.destroy
      @link.save
      redirect_to root_path, notice: 'Vote was taken back'
    elsif @vote.casted == false
      @link.num_votes += 1
      @vote.user_id = current_user.id
      @vote.neg_vote = false
      @vote.casted = true
      @vote.save
      @link.save
      redirect_to root_path, notice: 'Vote up was successfully cast'
    else
      redirect_to root_path, notice: 'Can\'t vote more than once'
    end
  end

  def vote_down
    @vote = Vote.find_or_create_by(user_id: current_user.id, link_id: params[:link_id])
    @link = Link.find(params[:link_id])
    if @vote.casted == true && @vote.neg_vote == false
      @link.num_votes -= 1
      @vote.destroy
      @link.save
      redirect_to root_path, notice: 'Vote was taken back'
    elsif @vote.casted == false || @vote.neg_vote == false
      @link.num_votes -= 1
      @vote.user_id = current_user.id
      @vote.neg_vote = true
      @vote.casted = true
      @vote.save
      @link.save
      redirect_to root_path, notice: 'Vote down was successfully cast'
    else
      redirect_to root_path, notice: 'Can\'t vote more than once'
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:user_id, :link_id)
    end
end
