class RequestsController < ApplicationController
  

  def index
    @request = Request.all
    update_state()
    # set_state(@request)
  end
  
  def new
    @request = Request.new
    # @request.users = Request.new
    
  end
  
  def create
    @request = Request.new(request_params)
    @request.state = "Pendente"
    if @request.save
      redirect_to request_path(@request), notice: "O documento foi enviado."
    else
      render 'new'
    end
  end

  def show
    @request = Request.find(params[:id])
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

  def update_state
    state_string = nil
    request = Request.all
    request.each do |r|
      r.users.each do |user|
        if user.signed.nil?
          state_string = "Pendente"
        elsif user.signed == false
          state_string = "Reprovada"  
        else
          state_string = "Aprovada"
        end
      end
      r.update(:state => "#{state_string}")
    end
  end
 

end