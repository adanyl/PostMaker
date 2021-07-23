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
      @succes = true
      if input[:title].empty?
        errors.add(:base, 'title is empty')
        @succes = false
      elsif input[:title].length > 50
        errors.add(:base, 'title is too large')
        @succes = false
      end

      if input[:post].empty?
        errors.add(:base, 'post is empty')
        @succes = false
      elsif input[:post].length > 250
        errors.add(:base, 'post is too large')
        @succes = false
      end

      if input[:social_networks].length == 1
        errors.add(:base, 'you must select at least 1 soсial network')
        @succes = false
      end

      if input[:schedule_time].nil?
        errors.add(:base, 'time is not stated')
        @succes = false
      elsif input[:schedule_time] < DateTime.now()
        errors.add(:base, 'Time must be in the future')
        @succes = false
      end
        if @succes == true
          input[:social_networks].drop(1).each do |social_network|
            @social_contents = SocialContent.create(:title => input[:title], :post => input[:post]) 
            @post = SocialPost.create(:schedule_time => input[:schedule_time], :social_content => @social_contents, :social_network => social_network) 
          end
        end
        raise StandardError, 'Try again' if errors.any?
    end
  end
end
