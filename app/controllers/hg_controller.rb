class HgController < ApplicationController
  WHITE_LIST = ['G36US0HDZ'].freeze
  def random
    if WHITE_LIST.include?(params[:channel_id])
      img_link = random_image
      loop do
        break unless img_link.empty?
        img_link = random_image
      end
      render json: {
        response_type: 'in_channel',
        text: 'You are welcome!',
        attachments: [
          image_url: img_link.first.linkimg
        ]
      }
    else
      render json: { text: "I'm dead" }
    end

  end

  private

  def random_image
    ImgLink.uncached do
      ImgLink.find_by_sql('SELECT TOP 1  ImgLink.* FROM ImgLink TABLESAMPLE(20 rows)  WHERE isbadurl = 0 AND (isnice = 0 or isnice is null)')
    end
  end
end
