class MessagesController < ApplicationController

  def show
    @message = Message.where(:permalink => params[:permalink]).first
    @messages = Message.where(:target_email => @message.target_email).where(['id != ?', @message.id]).paginate(
      :page => params[:page], :per_page => 20
    ) if @message
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
      flash[:error] = "Karny kutas nie wysłany! popraw formularz."
      render :action => "new"
    end
  end

  def search
    @message = Message.where(:target_email => params[:query].strip).first
    if @message
      @messages = Message.where(:target_email => params[:query].strip).order("id DESC").paginate(:page => params[:page], :per_page => 20)
    else
      @message = Message.new
      flash[:error] = "Podany email nie ma otrzymał jeszcze żadnego Karnego Kutasa."
      render :action => "new"
    end
  end

end
