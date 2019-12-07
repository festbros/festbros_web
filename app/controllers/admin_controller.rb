class AdminController < ApplicationController
    def index

    end

    def create
        admin =Admin.new(admin_params)
        if  admin.save  
            session[:user_id]  =admin.id
            redirect_to '/dashboard'
        else
            flash[:error] = admin.errors.full_message
            redirect_to "/"
        end

    end

        private
        def admin_params 
            params.require(:admin).permit(:username ,:password)
        end
end