class ApplicationController < ActionController::Base

  def status
    render json:  { status: 'ok' }
  end

  def pets
    pets = {
      'dog': 'fido',
      'cat': 'maru',
      'bird': 'tweety',
      'turtle': 'franky'
    }

    render json: pets
  end
end
