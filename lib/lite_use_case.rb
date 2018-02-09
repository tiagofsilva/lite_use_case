# Usage: LiteUseCase.call(params)

module LiteUseCase

  def self.included(base)
    base.class_eval do
      extend ClassMethods
    end

    attr_reader :result
  end

  def initialize(params)
    @result = Result.new(params)
  end

  def validate
    true
  end

  def _call
    call if valid?
  end

  def valid?
    validate
  end

  module ClassMethods
    def expose(variables)
      @variables << variables
      @variables.flatten
    end

    def exposed
      @variables.dup
    end

    def call(params={})
      new(params)._call
    end
  end

  class Result

    attr_accessor :params, :success

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
      self.success = false
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
