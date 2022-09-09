class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: :welcome
    
    def after_sign_in_path_for(groups)
      groups_path        
    end
    
end
