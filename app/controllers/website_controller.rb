class WebsiteController < ApplicationController
   
    def index
        @lunchdate = '2019/12/12 17:30:00'
        render layout: false
    end

    def livestream
        @content = Post.last.content
        puts 'deliveerrr'
        render layout: false
    end
    
    def regform
          #should save .. do later 
          @name = params[:name]
          @email = params[:email]
          @subject = params[:subject]
          @message = params[:msg]
          ExampleMailer.with(:name => @name,:email => @email,:subject => @subject,:message => @message).sample_email.deliver_now
        render json: {status: 'SUCCESS' , message: 'We are happy to receive your message , We will reply you soon ' } , status: :ok
       
    end
    def Subscribe
        #should save .. do later 
        # maillist =Maillist.new(maillist_params)
        # if Maillist.where(:mail => maillist_params.email).blank?  
            # maillist.save  
            render json: {status: 'SUCCESS' , message: 'Your email added to our mail list , Thanks for subscribe' } , status: :ok
        # else
        #     render json: {status: 'SUCCESS' , message: maillist.errors.full_message } , status: :ok
        # end
    end
    

    private
    def maillist_params
        params.require(:maillist).permit(:email)
    end
end
