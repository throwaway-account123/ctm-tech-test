# frozen_string_literal: true

# Controller handling all the necessary methods for this small app
class MainController < ApplicationController
  # GET '/'
  def index
    @transaction = Transaction.new
  end
end
