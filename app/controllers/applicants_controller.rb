class ApplicantsController < ApplicationController
  def index
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
        flash[:err] = 'Houve algum erro ao aplicar, tente novamente'
        format.html{ render 'positions/public_position' }
        format.js { render partial: 'applicants/new' }
      end
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:name, :email, :phone, :position_id)
  end
end
