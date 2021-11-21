require 'zip'

class ExportResume  

  def initialize(user, position, zip_name)
    @user = user
    @position = position
    @zip_name = zip_name
  end

  def generate
    applicants = @position.applicants

    files = []
    applicants.each do |applicant|
      files << save_files_on_server(applicant)
    end
    create_temporary_zip_file(files)
  end

  def save_files_on_server(applicant)
    temp_folder = File.join(Rails.root.join('tmp', 'resumes'))
    FileUtils.mkdir_p(temp_folder) unless Dir.exist?(temp_folder)

    filename = "#{applicant.name.parameterize}-#{applicant.resume.filename}"
    filepath = File.join(temp_folder, filename)
    File.open(filepath, 'wb') { |f| f.write(applicant.resume.download) }
    filepath
  end

  def create_temporary_zip_file(files)
    temp_file = File.join(Rails.root.join('tmp', @zip_name))
   
    
    begin
      Zip::OutputStream.open(temp_file) { |zos| }

      Zip::File.open(temp_file, Zip::File::CREATE) do |zip|
        files.each do |file|
          filename = File.basename file 
          zip.add(filename, file)
        end
      end
    ensure 
      files.each { |file| FileUtils.rm(file)  }
    end
  end
end