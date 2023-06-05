# frozen_string_literal: true

class LogsController < ApplicationController
  def index
    @logs = Log.all
  end
end
