# encoding: utf-8

class DownloadsUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_whitelist
    %w(doc docx ppt pptx xls xlsx pdf odt odp ods jpeg jpg png psd ai)
  end

end
