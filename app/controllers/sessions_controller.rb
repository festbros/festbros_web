class SessionsController < ApplicationController
    def create
        admin = Admin.find_by(username:login_params[:username])
        if admin && admin.authenticate(login_params[:password])
            session[:user_id] = admin.id
            session[:username] = admin.username
            redirect_to "/dashboard" 
        else
            flash[:login_errors] = ['Error in Username or password !'] 
            redirect_to '/auth/login'          
        end
    end

    def destroy
        session[:user_id]  =nil
        redirect_to '/auth/login'   
    end
  
    private
    def login_params
        params.require(:login).permit(:username,:password)
    end
    
end
