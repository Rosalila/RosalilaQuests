class ApplicationController < ActionController::Base
   protect_from_forgery   
   helper_method :current_user, :logged_in?, :verify_authentication
   
  protected  
   
  def current_user   
    @current_user ||= User.find(session[:user_id]) if session[:user_id]   
  end   
   
  def verify_authentication
    redirect_to root_url, :alert => "You need to be logged in to do that." unless logged_in?
  end
  
  def logged_in?
    current_user.present?
  end
  
  
  def iAmQuestMaster speciality_id
    qms=QuestMaster.where(:profile_id=>Profile.where(:users_id=>current_user.id)[0].id)
    qms=qms.where(:speciality_id=>speciality_id)
    if qms[0]==nil
      return false
    else
      return true
    end
  end

  def getMyQuestMasterLevel speciality_id
    qms=QuestMaster.where(:profile_id=>Profile.where(:users_id=>current_user.id)[0].id)
    qms=qms.where(:speciality_id=>speciality_id)
    return qms[0].level
  end
 
end
