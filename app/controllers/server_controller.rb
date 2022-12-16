# frozen_string_literal: true

# controller
class ServerController < ApplicationController
  include ServerHelper
  before_action :set_params, only: :result
  before_action :calc_result, only: :result

  def result
    @xml = { input: @input, result_array: @res_arr, array_size: @count }
    respond_to do |format|
      format.html
      format.xml { render xml: @xml }
    end
  end
end
