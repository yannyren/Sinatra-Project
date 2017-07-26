class FileUploader

  def self.run(picture_hash)
  
    filename = picture_hash[:filename]
    file = picture_hash[:tempfile]

    File.open("./public/images/#{filename}", "wb") do |f|
      f.write(file.read)
    end
    
  end 

end 