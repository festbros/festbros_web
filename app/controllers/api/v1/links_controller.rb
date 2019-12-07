module Api
    module V1
        class LinksController < ApplicationController
            skip_before_action :verify_authenticity_token
            def index
               links = Post.all.order("created_at DESC")
               render json: {status: 'SUCCESS' , message: 'Links loaded' ,data: links} , status: :ok
            end
            def show
                find_post(params[:id])
            end
            def contact
                @name = params[:name]
                @email = params[:email]
                @subject = params[:subject]
                @message = params[:message]
                @mobile = params[:mobile]
                ExampleMailer.with(:name => @name,:email => @email,:subject => @subject,:message => @message,:mobile => @mobile).sample_email.deliver_now
                render json: {status: 'SUCCESS' , message: 'We are happy to receive your message , We will reply you soon '  } , status: :ok
            end
            def last
                links =  Post.order("created_at").last
                render json: {status: 'SUCCESS' , message: 'Links loaded' ,data: links} , status: :ok
             end
            private
            def find_post (id)
                link = Post.find(id)
                render json: {status: 'SUCCESS' , message: 'Link loaded' ,data: link} , status: :ok

            end
        end
    end
end