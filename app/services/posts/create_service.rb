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
      # TODO:
      # 1. create SocialContent with title and post from input
      # 2. create as many related SocialPosts as many social_networks you have selected
      # 3. care about data consistency (Please read about ActiveRecord::Base.transaction)
      # 4. You must not create any SocialContent and SocialPosts:
      #   - if schedule_time in the past
      #   - if social_networks is empty array
      #   - if post length more then 250 symbols
      #   - if title length more then 50 symbols

      errors.add(:base, 'Perform functionality not implemented yet!')

      @post = nil # Please replace 'nil' with real created post
    end
  end
end
