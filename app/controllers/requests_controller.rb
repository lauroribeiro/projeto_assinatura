class RequestsController < ApplicationController
  
  def index
    @request = Request.all
  end
  
  def new
    @request = Request.new
    
  end
  
  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to requests_path, notice: "O documento foi enviado."
    else
      render 'new'
    end
  end
  
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path, notice: "A solicitação foi deletada."
  end

  private

  def request_params
    params.require(:request).permit(:docname, :attachment)
  end

end