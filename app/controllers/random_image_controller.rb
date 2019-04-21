class RandomImageController < ApplicationController
  def show
    images = [ "img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg", "img5.jpg" ]
    random_num = rand(5)
    @random_image = images[random_num]
  end
end
