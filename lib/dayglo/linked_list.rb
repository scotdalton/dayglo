require_relative 'linked_list/item'
module Dayglo
  # Pure Ruby implementation of a LinkedList
  class LinkedList

    # Pushes an object onto the head of the linked list
    # Insert on a list of n elements is O(1)
    def insert(object)
      old_head = head
      @head = LinkedList::Item.new(object)
      @tail ||= head
      head.next = old_head unless old_head.nil?
      nil
    end

    # Finds and returns an object from the linked list
    # Search on a list of n elements is O(n)
    def search(object)
      item = find_item_by_object(head, object)
      item.object unless item.nil?
    end

    # Deletes and returns an object in the linked list
    # Delete on a list of n elements is O(n)
    def delete(object)
      deleted_item = find_item_by_object(head, object)
      unless deleted_item.nil?
        if deleted_item.tail?
          @head = nil
        else
          previous_item = find_item_by_next_item(head, deleted_item)
          # Link the deleted item's next item to the previous item
          previous_item.next = deleted_item.next
        end
        deleted_item.object
      end
    end

    # Returns the last element inserted into the list
    # Minimum on a list of n elements is O(1)
    def minimum
      head.object unless head.nil?
    end

    # Returns the first element inserted into the list
    # Maximum on a list of n elements is O(1)
    def maximum
      tail.object unless tail.nil?
    end

    # Boolean indicating that the list is empty
    def empty?
      head.nil?
    end

    # String representation of the list
    def to_s
      "#{items_to_s(head)}"
    end

    private
    attr_reader :head, :tail

    def items_to_s(item)
      unless item.nil?
        (item.tail?) ? "#{item}" : "#{item}, #{items_to_s(item.next)}"
      end
    end

    def find_item_by_next_item(item, next_item)
      unless item.nil?
        if item.next == next_item
          item
        else
          find_item_by_next_item(item.next, next_item)
        end
      end
    end

    def find_item_by_object(item, object)
      unless item.nil?
        if item.object == object
          item
        else
          find_item_by_object(item.next, object)
        end
      end
    end
  end
end
