Resque Timer
=============

Captures the time it took to execute a job. Stores times in the following key pattern:

    stats:elapsed:JobName:*

Using Redis to fetch all keys like this will give you all completed job execution times of the type `JobName`. 

By default, Timer sets the key expiration time to 3600 seconds. This time can be overrided like this:

    require 'resque/plugins/timer'
    
    class JobName
      @queue = :primary
      @expiration = 7200 #2 hours

      def self.perform(record)
        other_stuff_and_junk
      end
    end

You could, alternatively, define an `expiration` method.
