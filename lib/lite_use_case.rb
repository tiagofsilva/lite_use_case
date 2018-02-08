# Usage: LiteUseCase.call(params)

module LiteUseCase

  def self.included(base)
    base.class_eval do
      extend ClassMethods
    end
  end

  def call
    UseCase.new(params).call do |params|
      yield params if valid?
    end
  end

  def validate
    # TODO: Able to avoid invoking #call. Also invalidates Result object
  end

  class UseCase

    def initialize(params)
      @params = params
    end

    def call
      if block_given?

      end
    end

    class Result

      attr_reader :params, :success

      def initialize(params={})
        @params = params
        @success = true
        @errors = []
      end

      def successful?
        success && @errors.empty?
      end

      def failure?
        !successful?
      end

      def fail!
        success = false
      end

      def add_error(error)
        @errors.add(error) unless error.nil?
        nil
      end

      def errors
        @errors.dup
      end

    end

  end

  module ClassMethods

    def expose(variables)
      @variables << variables
      @variables.flatten
      nil
    end

    def exposed
      @variables.dup
    end

    def _call(params={})
      LiteUseCase.new(params).call
    end

  end

end
