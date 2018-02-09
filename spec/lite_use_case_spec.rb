require 'spec_helper'

describe LiteUseCase do

  let(:interactor) {
    build_interactor do
      def call; puts 'HERE' ; end
    end
  }

  def build_interactor(&block)
    interactor = Class.new.send(:include, LiteUseCase)
    interactor.class_eval(&block) if block
    interactor
  end

  describe '#call' do
    context 'when validation passes' do
      it 'is invoked' do
        expect_any_instance_of(interactor).to receive(:call)

        allow_any_instance_of(interactor).to receive(:valid?).and_return(true)
        interactor.call({a: 1, b: 2})
      end
    end
  end

end
