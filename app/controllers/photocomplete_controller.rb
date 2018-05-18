class PhotocompleteController < ApplicationController
  def success
  end

  def fail
  end
  
  def check
    @user = current_user
    userquest = Userquest.where(user_id: @user.id, success: 2).last
    

    @quest = Quest.find_by_id(userquest.quest_id)
    
    require 'aws-sdk-rails'

    image = Userquest.find(userquest.id).photoData.to_s
    # quest = Userquest.find(@quest.needs).quest_id.to_s

    @questneeds = @quest.needs.to_s

    Aws.config.update({
       credentials: Aws::Credentials.new(ENV["AWS_Key"], ENV["AWS_Secret"]),
       region: "us-east-1"
    })

    # post = Post.find(params[:id]).image.to_s

    # str = "https://dailyquestbucket.s3.amazonaws.com/uploads/post/image/2/cutecat.jpg"
    strsplit = image.split('/',4)
    client = Aws::Rekognition::Client.new
    resp = client.detect_labels(
            image: {
              s3_object: {
                bucket: "dailyquestbucket", name: strsplit[3]
                }
              }
          )

    result = resp.labels
    
    # arr = [#<struct Aws::Rekognition::Types::Label name="Food", confidence=97.53509521484375>, #<struct Aws::Rekognition::Types::Label name="Pasta", confidence=97.53509521484375>, #<struct Aws::Rekognition::Types::Label name="Spaghetti", confidence=97.53509521484375>, #<struct Aws::Rekognition::Types::Label name="Bowl", confidence=76.52090454101562>, #<struct Aws::Rekognition::Types::Label name="Dish", confidence=76.52090454101562>, #<struct Aws::Rekognition::Types::Label name="Meal", confidence=76.52090454101562>, #<struct Aws::Rekognition::Types::Label name="Plate", confidence=76.52090454101562>]

    result.each do |a|
      if a.name.include?(@questneeds)
        @for_min = a.name
      end
    end

    
    
    if @for_min.present?
      userquest.update(success: '1')
      redirect_to '/makeQuest_success'
    else
      
      redirect_to '/makeQuest_failed'
    end
    
  end
end
