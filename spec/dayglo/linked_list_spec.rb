require 'spec_helper'
module Dayglo
  describe LinkedList do
    subject(:linked_list) { LinkedList.new }
    it { should be_a LinkedList }
  end
end
