class MessagesController < ApplicationController

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @message.ip = request.env["HTTP_X_FORWARDED_FOR"]

    if @message.save
      UserMailer.notify(@message).deliver
      UserMailer.notify_copy(@message).deliver
      redirect_to root_path
    else
      render :action => "new"
    end
  end

  def search
    @messages = Message.find(:all,
      :conditions => ["target_email = ?", params[:query].strip]).paginate(
        :page => params[:page], :per_page => 10
      )
  end

end
