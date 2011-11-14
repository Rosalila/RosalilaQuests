class QuestTreesController < ApplicationController
  # GET /quest_trees
  # GET /quest_trees.json
  def index
    @quest_trees = QuestTree.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quest_trees }
    end
  end

  # GET /quest_trees/1
  # GET /quest_trees/1.json
  def show
    @quest_tree = QuestTree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quest_tree }
    end
  end

  # GET /quest_trees/new
  # GET /quest_trees/new.json
  def new
    @quest_tree = QuestTree.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quest_tree }
    end
  end

  # GET /quest_trees/1/edit
  def edit
    @quest_tree = QuestTree.find(params[:id])
  end

  # POST /quest_trees
  # POST /quest_trees.json
  def create
    @quest_tree = QuestTree.new(params[:quest_tree])

    respond_to do |format|
      if @quest_tree.save
        format.html { redirect_to @quest_tree, notice: 'Quest tree was successfully created.' }
        format.json { render json: @quest_tree, status: :created, location: @quest_tree }
      else
        format.html { render action: "new" }
        format.json { render json: @quest_tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quest_trees/1
  # PUT /quest_trees/1.json
  def update
    @quest_tree = QuestTree.find(params[:id])

    respond_to do |format|
      if @quest_tree.update_attributes(params[:quest_tree])
        format.html { redirect_to @quest_tree, notice: 'Quest tree was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @quest_tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quest_trees/1
  # DELETE /quest_trees/1.json
  def destroy
    @quest_tree = QuestTree.find(params[:id])
    @quest_tree.destroy

    respond_to do |format|
      format.html { redirect_to quest_trees_url }
      format.json { head :ok }
    end
  end
end
