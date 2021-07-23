module Posts
  class FeedFilter < BaseFilter
    def perform
      scope = base_scope
      scope = scope.where("title like ? or post like ?", "%" + input[:search_text] + "%", "%" + input[:search_text] + "%") if input[:search_text].present?
      scope = scope.where('social_network IN (?)', input[:social_networks]).references(:social_posts) if input[:social_networks].present?
      scope = scope.where('schedule_time >= ?', input[:date_from]).references(:social_posts) if input[:date_from].present?
      scope = scope.where('schedule_time <= ?', input[:date_to]).references(:social_posts) if input[:date_to].present?
      scope
    end
    private

    def base_scope
      SocialContent.all.includes(:social_posts)
    end
  end
end
