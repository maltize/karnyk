class HomeController < ApplicationController

  def index
    @messages = Message.paginate(:page => params[:page], :per_page => 10)
  end

end
