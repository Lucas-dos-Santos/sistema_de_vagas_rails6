class ApplicantsController < ApplicationController
  before_action :set_position, only: [:index]

  def index
    @applicants = @position.applicants

    respond_to do |format|
      format.html
      format.csv { send_data @position.applicants.as_csv }
      format.zip do
        UserMailer.export_resume(current_user.id, @position.id).deliver_later
        flash[:suc] = 'Curriculos enviados. Verifique seu e-mail.'
        redirect_to action: :index
      end
    end
  end

  def new
  end
    
  def create
    @applicant = current_user.applicants.new(applicant_params)
    @position = Position.find(applicant_params[:position_id])
    
    respond_to do |format|
      if @applicant.save
        flash[:suc] = 'Vaga aplicada com sucesso!'
        format.html{ redirect_to public_position_path(@applicant.position.slug) }
        format.js { render 'applicants/success'}
      else
        flash.now[:err] = 'Houve algum erro ao aplicar, tente novamente'
        format.html{ render 'positions/public_position' }
        format.js { render partial: 'applicants/new' }
      end
    end
  end

  private

  def set_position
    begin
      @position= current_user.company.positions.find(params[:position_id])
    rescue 
      redirect_to positions_path
    end
  end

  def applicant_params
    params.require(:applicant).permit(:name, :email, :phone, :position_id, :resume)
  end
end
