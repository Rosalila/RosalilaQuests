class CompletedQuestsController < ApplicationController
  # GET /completed_quests
  # GET /completed_quests.json
  def index
    @completed_quests = CompletedQuest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @completed_quests }
    end
  end

  # GET /completed_quests/1
  # GET /completed_quests/1.json
  def show
    @completed_quest = CompletedQuest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @completed_quest }
    end
  end

  # GET /completed_quests/new
  # GET /completed_quests/new.json
  def new
    @completed_quest = CompletedQuest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @completed_quest }
    end
  end

  # GET /completed_quests/1/edit
  def edit
    @completed_quest = CompletedQuest.find(params[:id])
  end

  # POST /completed_quests
  # POST /completed_quests.json
  def create
    @completed_quest = CompletedQuest.new(params[:completed_quest])

    respond_to do |format|
      if @completed_quest.save
        format.html { redirect_to @completed_quest, notice: 'Completed quest was successfully created.' }
        format.json { render json: @completed_quest, status: :created, location: @completed_quest }
      else
        format.html { render action: "new" }
        format.json { render json: @completed_quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /completed_quests/1
  # PUT /completed_quests/1.json
  def update
    @completed_quest = CompletedQuest.find(params[:id])

    respond_to do |format|
      if @completed_quest.update_attributes(params[:completed_quest])
        format.html { redirect_to @completed_quest, notice: 'Completed quest was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @completed_quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /completed_quests/1
  # DELETE /completed_quests/1.json
  def destroy
    @completed_quest = CompletedQuest.find(params[:id])
    @completed_quest.destroy

    respond_to do |format|
      format.html { redirect_to completed_quests_url }
      format.json { head :ok }
    end
  end
end
