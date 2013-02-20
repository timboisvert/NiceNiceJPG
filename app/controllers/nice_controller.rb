class NiceController < ApplicationController
  
  DEFAULT_FAMILY = "vanilla"
  SPECIAL_FAMILY = "5.0"
  
  def index
  end
  
  def vanilla
    width = params[:width]
    height = params[:height]
    family = DEFAULT_FAMILY
    handleimage(width, height, family)
  end
  
  def vanillasquare
    width = params[:square]
    height = params[:square]
    family = DEFAULT_FAMILY
    handleimage(width, height, family)    
  end
  
  def family
    width = params[:width]
    height = params[:height]
    family = SPECIAL_FAMILY
    handleimage(width, height, family)      
  end
  
  def familysquare
    width = params[:square]
    height = params[:square]
    family = SPECIAL_FAMILY
    handleimage(width, height, family)    
  end
  
  private 
  
  def handleimage(desiredWidth, desiredHeight, family)
      
      #determine if landscape or portrait is being requested
      orientation = (desiredWidth.to_i >= desiredHeight.to_i) ? "landscape" : "portrait"
      
      image = Magick::Image.read(File.expand_path("../../pics/#{family}/#{orientation}/vert1.jpg", __FILE__)).first
      image.resize_to_fill!(desiredWidth.to_i, desiredHeight.to_i)
      image_as_blob = image.to_blob { self.quality=50 }
      send_data image_as_blob, :type => "image/jpeg", :disposition => "inline"
  end
  
end