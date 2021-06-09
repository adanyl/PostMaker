module Posts
  class FeedFilter < BaseFilter
    def perform
      # TODO:
      # 1. apply all filters that come from input
      #   - filter by title/post contains search_text
      #   - filter by social networks
      #   - filter by date range (date_from, date_to)

      base_scope
    end

    private

    # NOTE: this method can be modified
    def base_scope
      SocialContent.all.includes(:social_posts)
    end
  end
end
