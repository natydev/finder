module TestPicture
  module_function
 
  def file_data
    attacher = Shrine::Attacher.new
    attacher.set(uploaded_file)
 
    # if you're processing derivatives 
    attacher.set_derivatives(
      large:  uploaded_file,
      medium: uploaded_file,
      small:  uploaded_file,
    )
 
    attacher.data
  end
 
  def uploaded_file
    file = File.open(File.join(Rails.root, "/spec/fixtures/", "generic.jpg"), binmode: true)
    file_size = file.size
    # for performance we skip metadata extraction and assign test metadata 
    upload_file = Shrine.upload(file, :store, metadata: false)
    upload_file.metadata.merge!(
      "size"      => file_size,
      "mime_type" => "image/jpeg",
      "filename"  => "test.jpg",
    )
    upload_file
  end
end
