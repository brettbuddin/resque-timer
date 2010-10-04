module Resque
  module Plugins
    module Timer
      attr_accessor :expiration

      def expiration
        @expiration || 3600
      end

      def timer_key(type, *args)
        "timer:#{type}:#{self.name}:#{args.to_s}"
      end

      def before_perform_start_timer(*args)
        Resque.redis.set timer_key("started", *args), Time.now.to_i
      end

      def after_perform_calculate_time_elapsed(*args)
        s_key = timer_key("started", *args)
        e_key = timer_key("elapsed", *args)

        started = Resque.redis.get s_key

        Resque.redis.del s_key
        Resque.redis.set e_key, Time.now.to_i - started.to_i
        Resque.redis.expire e_key, self.expiration
      end

      def on_failure_clean_up_timer(e, *args)
        Resque.redis.del timer_key("started", *args)
      end
    end
  end
end
