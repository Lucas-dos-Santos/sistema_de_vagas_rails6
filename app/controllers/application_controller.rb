class ApplicationController < ActionController::Base

  def create
    @applicant = current_user.applicants.new(applicant_params)
    if @applicant.save
      flash[:suc] = 'Vaga aplicada com sucesso!'
    else
      flash[:err] = 'Houve algum erro ao aplicar, tente novamente'
    end
    redirect_to public_position_path(@applicant.position.slug)
  end

  private

  def applicant_params
    params.require(:applicant).permit(:name, :email, :phone, :position_id)
  end
end
