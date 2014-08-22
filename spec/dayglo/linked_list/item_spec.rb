require 'spec_helper'
module Dayglo
  describe LinkedList::Item do
    let(:object) { Object.new }
    let(:next1) { LinkedList::Item.new('next') }
    subject(:item) { LinkedList::Item.new(object) }
    describe '#object' do
      subject { item.object }
      it { should eq object }
    end
    describe '#next' do
      subject { item.next }
      it { should be nil }
    end
    describe '#next=' do
      subject { item.next=(next1) }
      it { should eq next1 }
      it 'should set the next item' do
        subject
        expect(item.next).to eq next1
      end
      context 'when the next is not a LinkedList::LinkedItem' do
        let(:next1) { 'invalid' }
        it 'should raise an ArgumentError' do
          expect { subject }.to raise_error ArgumentError
        end
      end
    end
    describe '#tail?' do
      subject { item.tail? }
      context 'when it does not have a next item' do
        it { should be true }
      end
      context 'when it does have a next item' do
        before { item.next=(next1) }
        it { should be false }
      end
    end
    describe '#to_s' do
      subject { item.to_s }
      it { should eq object.to_s }
    end
  end
end
