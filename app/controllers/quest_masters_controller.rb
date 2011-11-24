class QuestMastersController < ApplicationController
  # GET /quest_masters
  # GET /quest_masters.json
  def index
    @quest_masters = QuestMaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quest_masters }
    end
  end

  # GET /quest_masters/1
  # GET /quest_masters/1.json
  def show
    @quest_master = QuestMaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quest_master }
    end
  end

  # GET /quest_masters/new
  # GET /quest_masters/new.json
  def new
    @quest_master = QuestMaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quest_master }
    end
  end

  # GET /quest_masters/1/edit
  def edit
    @quest_master = QuestMaster.find(params[:id])
  end

  # POST /quest_masters
  # POST /quest_masters.json
  def create
    @quest_master = QuestMaster.new(params[:quest_master])
    if iAmCoordinator
      respond_to do |format|
        if @quest_master.save
          format.html { redirect_to @quest_master, notice: 'Quest master was successfully created.' }
          format.json { render json: @quest_master, status: :created, location: @quest_master }
        else
          format.html { render action: "new" }
          format.json { render json: @quest_master.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to "/", notice: 'No no no picarin!'
    end
  end

  # PUT /quest_masters/1
  # PUT /quest_masters/1.json
  def update
    @quest_master = QuestMaster.find(params[:id])
    if iAmCoordinator
      respond_to do |format|
        if @quest_master.update_attributes(params[:quest_master])
          format.html { redirect_to @quest_master, notice: 'Quest master was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @quest_master.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to "/", notice: 'No no no picarin!'
    end
  end

  # DELETE /quest_masters/1
  # DELETE /quest_masters/1.json
  def destroy
    @quest_master = QuestMaster.find(params[:id])
    if iAmCoordinator
      @quest_master.destroy

      respond_to do |format|
        format.html { redirect_to quest_masters_url }
        format.json { head :ok }
      end
    else
      redirect_to "/", notice: 'No no no picarin!'
    end
  end
end
