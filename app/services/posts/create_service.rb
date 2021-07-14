module Posts
  class CreateService < Service
    class Input < BaseInput
      attribute :title, type: String
      attribute :post, type: String
      attribute :social_networks, array: true
      attribute :schedule_time, type: Date

      validates :title, presence: true
      validates :post, presence: true
      validates :schedule_time, presence: true
    end

    attr_reader :input, :post

    def perform
      input[:social_networks].drop(1).each do |social_network|
        if input[:schedule_time] < DateTime.now() || input[:social_networks].empty?  || input[:post].length > 250 || input[:title].length > 50 
          social_contents = nil
          @post = nil
        else
          @social_contents = SocialContent.create(:title => input[:title], :post => input[:post]) 
          @post = SocialPost.create(:schedule_time => input[:schedule_time], :social_content => @social_contents, :social_network => social_network)
        end
      end
    end
  end
end
