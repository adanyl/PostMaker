module Posts
  class FeedFilter < BaseFilter
    def perform
      if input[:search_text] == nil || input[:social_networks] == nil || input[:date_from] == nil || input[:date_to] == nil
      base_scope  
      else
        SocialContent.where("title like ? or post like ?", "%" + input[:search_text] + "%", "%" + input[:search_text] + "%").all.includes(:social_posts).all.includes(:social_posts).where('schedule_time >= ? and schedule_time <= ? and social_network IN (?)',  input[:date_from], input[:date_to], input[:social_networks]).references(:social_posts)
      end
    end
    private

    def base_scope
      SocialContent.all.includes(:social_posts)
    end
  end
end
