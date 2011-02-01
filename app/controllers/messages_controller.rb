class MessagesController < ApplicationController

  def show
    @message = Message.where(:permalink => params[:permalink]).first
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
      flash[:notice] = "Karny Kutas został poprawnie wysłany."
      redirect_to root_path
    else
      flash[:error] = "Karny kutas nie wysłany"
      render :action => "new"
    end
  end

  def search
    @messages = Message.where(:target_email => params[:query]).paginate(
        :page => params[:page], :per_page => 10
      )
  end

end
