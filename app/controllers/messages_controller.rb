class MessagesController < ApplicationController

  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def create
    @message = Message.new(params[:message])
    @message.ip = request.env["HTTP_X_FORWARDED_FOR"]

    respond_to do |format|
      if @message.save
        UserMailer.notify(@message).deliver

        format.html { redirect_to(@message, :notice => 'Message was successfully created.') }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  def search
    @messages = Message.find(:all,
      :conditions => ["target_name = ? OR target_email = ?", params[:query], params[:query]]).paginate(
        :page => params[:page], :per_page => 10
      )
  end

end
