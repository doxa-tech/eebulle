# encoding: utf-8

class MessagesUploader < CarrierWave::Uploader::Base

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def filename
    if original_filename.present?
      date = model.date.strftime("%d-%m-%y")
      "EEBulle_#{date}_#{model.speaker}_#{model.name}.#{file.extension}"
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(mp3 m4a)
  end

  def fog_attributes
  { 'Content-Disposition' => "attachment" }
  end

end
