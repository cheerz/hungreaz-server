module Extendable

  def self.included base
    base.extend ClassMethods
    base.class_eval do
    end
  end

  module ClassMethods

    private

    def indexable attribute
      @indexable_resource = attribute
      def [] value
        where(@indexable_resource => value).first
      end
    end

  end
end
