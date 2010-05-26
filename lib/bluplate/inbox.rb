module Bluplate
  
  class Inbox
    include Persist::Base
    attr_accessor :tasks, :sources

    def initialize(opts={})
      @tasks = {}
      @sources = opts[:sources]
    end

    def to_hash
      {:tasks => @tasks }
    end

    def retrieve 
      if @sources && !@sources.empty? 
        @sources.inject(@tasks){|e, i| e + i.import}
      end
    end

  end
end