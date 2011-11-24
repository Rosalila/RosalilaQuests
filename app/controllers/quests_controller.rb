class QuestsController < ApplicationController
  # GET /quests
  # GET /quests.json
  def index
    @quests = Quest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quests }
    end
  end

  # GET /quests/1
  # GET /quests/1.json
  def show
    @quest = Quest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quest }
    end
  end

  # GET /quests/new
  # GET /quests/new.json
  def new
    @quest = Quest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quest }
    end
  end

  # GET /quests/1/edit
  def edit
    @quest = Quest.find(params[:id])
  end

  # POST /quests
  # POST /quests.json
  def create
    @quest = Quest.new(params[:quest])
    @quest.creator_id=Profile.where(:users_id=>current_user.id)[0].id
    if iAmQuestMaster @quest.speciality_id
      if (getMyQuestMasterLevel (@quest.speciality_id))>(@quest.level)
        respond_to do |format|
          if @quest.save
            format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
            format.json { render json: @quest, status: :created, location: @quest }
          else
            format.html { render action: "new" }
            format.json { render json: @quest.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to "/", notice: 'No tienes el nivel suficiente para crear esta quest!'
      end
    else
      redirect_to "/", notice: 'No tienes la especialdidad necesaria para crear esta quest!'
    end
  end

  # PUT /quests/1
  # PUT /quests/1.json
  def update
    @quest = Quest.find(params[:id])
    if iAmQuestMaster @quest.speciality_id
      if (getMyQuestMasterLevel (@quest.speciality_id))>(@quest.level)
        respond_to do |format|
          if @quest.update_attributes(params[:quest])
            format.html { redirect_to @quest, notice: 'Quest was successfully updated.' }
            format.json { head :ok }
          else
            format.html { render action: "edit" }
            format.json { render json: @quest.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to "/", notice: 'No tienes el nivel suficiente para editar esta quest!'
      end
    else
      redirect_to "/", notice: 'No tienes la especialdidad necesaria para editar esta quest!'
    end
  end

  # DELETE /quests/1
  # DELETE /quests/1.json
  def destroy
    @quest = Quest.find(params[:id])
    if iAmQuestMaster @quest.speciality_id
      if (getMyQuestMasterLevel (@quest.speciality_id))>(@quest.level)
        @quest.destroy
        respond_to do |format|
          format.html { redirect_to quests_url }
          format.json { head :ok }
        end
      else
        redirect_to "/", notice: 'No tienes el nivel suficiente para destruir esta quest!'
      end
    else
      redirect_to "/", notice: 'No tienes la especialdidad necesaria para destruir esta quest!'
    end
  end
end
