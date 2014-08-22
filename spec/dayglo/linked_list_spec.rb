require 'spec_helper'
module Dayglo
  describe LinkedList do
    let(:object) { Object.new }
    subject(:linked_list) { LinkedList.new }
    it { should be_a LinkedList }
    describe '#empty?' do
      subject { linked_list.empty? }
      context 'when there are no items in the list' do
        it { should be true }
      end
      context 'when there are items in the list' do
        before { linked_list.insert(object) }
        it { should be false }
      end
    end
    describe '#insert' do
      subject { linked_list.insert(object) }
      it { should be nil }
      it 'should insert an item into the list' do
        expect(linked_list).to be_empty
        subject
        expect(linked_list).not_to be_empty
      end
    end
    describe '#search' do
      subject { linked_list.search(object) }
      context 'when there is one item in the list' do
        context 'and the item matches the given object' do
          before { linked_list.insert(object) }
          it { should eq object }
        end
        context 'but the item does not match the given object' do
          before { linked_list.insert(Object.new) }
          it { should be nil }
        end
      end
      context 'when there are many items in the list' do
        context 'and only one item matches the given object' do
          before { 5.times { linked_list.insert(Object.new) } }
          before { linked_list.insert(object) }
          before { 5.times { linked_list.insert(Object.new) } }
          it { should eq object }
        end
        context 'and several items match the given object' do
          before { 5.times { linked_list.insert(Object.new) } }
          before { 3.times { linked_list.insert(object) } }
          before { 5.times { linked_list.insert(Object.new) } }
          it { should eq object }
        end
        context 'but no items match the given object' do
          before { 5.times { linked_list.insert(Object.new) } }
          it { should be nil }
        end
      end
    end
    describe '#delete' do
      subject { linked_list.delete(object) }
      context 'when there is one item in the list' do
        context 'and the item matches the given object' do
          before { linked_list.insert(object) }
          it { should eq object }
          it 'should not find the object when searching' do
            expect(linked_list.search(object)).to eq object
            subject
            expect(linked_list.search(object)).to be nil
          end
        end
        context 'but the item does not match the given object' do
          before { linked_list.insert(Object.new) }
          it { should be nil }
          it 'should not find the object when searching' do
            expect(linked_list.search(object)).to be nil
            subject
            expect(linked_list.search(object)).to be nil
          end
        end
      end
      context 'when there are many items in the list' do
        context 'and only one item matches the given object' do
          before { 5.times { linked_list.insert(Object.new) } }
          before { linked_list.insert(object) }
          before { 5.times { linked_list.insert(Object.new) } }
          it { should eq object }
          it 'should not find the object when searching' do
            expect(linked_list.search(object)).to eq object
            subject
            expect(linked_list.search(object)).to be nil
          end
        end
        context 'and several items match the given object' do
          before { 5.times { linked_list.insert(Object.new) } }
          before { 3.times { linked_list.insert(object) } }
          before { 5.times { linked_list.insert(Object.new) } }
          it { should eq object }
          it 'should find the object when searching' do
            expect(linked_list.search(object)).to eq object
            subject
            expect(linked_list.search(object)).to eq object
          end
        end
        context 'but no items match the given object' do
          before { 5.times { linked_list.insert(Object.new) } }
          it { should be nil }
          it 'should not find the object when searching' do
            expect(linked_list.search(object)).to be nil
            subject
            expect(linked_list.search(object)).to be nil
          end
        end
      end
    end
    describe '#minimum' do
      subject { linked_list.minimum }
      context 'when there are no items' do
        it { should eq nil}
      end
      context 'when there is one item' do
        before { linked_list.insert('item1') }
        it { should eq 'item1'}
      end
      context 'when there is more than one item' do
        before { 3.times { |n| linked_list.insert("item#{n+1}") } }
        it { should eq 'item3' }
      end
    end
    describe '#maximum' do
      subject { linked_list.maximum }
      context 'when there are no items' do
        it { should eq nil}
      end
      context 'when there is one item' do
        before { linked_list.insert('item1') }
        it { should eq 'item1'}
      end
      context 'when there is more than one item' do
        before { 3.times { |n| linked_list.insert("item#{n+1}") } }
        it { should eq 'item1' }
      end
    end
    describe '#to_s' do
      subject { linked_list.to_s }
      context 'when there are no items' do
        it { should eq ''}
      end
      context 'when there is one item' do
        before { linked_list.insert('item1') }
        it { should eq 'item1' }
      end
      context 'when there is more than one item' do
        before { 3.times { |n| linked_list.insert("item#{n+1}") } }
        it { should eq 'item3, item2, item1' }
      end
    end
  end
end
