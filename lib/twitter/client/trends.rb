module Twitter
  class Client
    # Defines methods related to global trends
    # @see Twitter::Client::LocalTrends
    module Trends
      # Returns the top ten topics that are currently trending on Twitter
      #
      # @see https://dev.twitter.com/docs/api/1/get/trends
      # @rate_limited Yes
      # @requires_authentication No
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @return [Array]
      # @example Return the top ten topics that are currently trending on Twitter
      #   Twitter.trends
      def trends(options={})
        get('trends', options, :json)['trends']
      end

      # Returns the current top 10 trending topics on Twitter
      #
      # @see https://dev.twitter.com/docs/api/1/get/trends/current
      # @rate_limited Yes
      # @requires_authentication No
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [String] :exclude Setting this equal to 'hashtags' will remove all hashtags from the trends list.
      # @return [Array]
      # @example Return the current top 10 trending topics on Twitter
      #   Twitter.trends_current
      def trends_current(options={})
        get('trends/current', options, :json)['trends']
      end

      # Returns the top 20 trending topics for each hour in a given day
      #
      # @see https://dev.twitter.com/docs/api/1/get/trends/daily
      # @rate_limited Yes
      # @requires_authentication No
      # @response_format `json`
      # @param date [Date] The start date for the report. A 404 error will be thrown if the date is older than the available search index (7-10 days). Dates in the future will be forced to the current date.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :exclude Setting this equal to 'hashtags' will remove all hashtags from the trends list.
      # @return [Array]
      # @example Return the top 20 trending topics for each hour of October 24, 2010
      #   Twitter.trends_daily(Date.parse("2010-10-24"))
      def trends_daily(date=Date.today, options={})
        get('trends/daily', options.merge(:date => date.strftime('%Y-%m-%d')), :json)['trends']
      end

      # Returns the top 30 trending topics for each day in a given week
      #
      # @see https://dev.twitter.com/docs/api/1/get/trends/weekly
      # @rate_limited Yes
      # @requires_authentication No
      # @response_format `json`
      # @param date [Date] The start date for the report. A 404 error will be thrown if the date is older than the available search index (7-10 days). Dates in the future will be forced to the current date.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :exclude Setting this equal to 'hashtags' will remove all hashtags from the trends list.
      # @return [Array]
      # @example Return the top ten topics that are currently trending on Twitter
      #   Twitter.trends_weekly(Date.parse("2010-10-24"))
      def trends_weekly(date=Date.today, options={})
        get('trends/weekly', options.merge(:date => date.strftime('%Y-%m-%d')), :json)['trends']
      end
    end
  end
end
