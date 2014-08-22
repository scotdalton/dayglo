module Dayglo
  class LinkedList
    class Item
      attr_reader :object, :next

      def initialize(object)
        @object ||= object
      end

      def tail?
        self.next.nil?
      end

      def next=(next1)
        unless next1.is_a? Item
          raise ArgumentError.new("Expecting #{next1} to be a LinkedList::Item")
        end
        @next = next1
      end

      def to_s
        object.to_s
      end
    end
  end
end
