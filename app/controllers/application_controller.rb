class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  ,unless: -> { request.format.json? } ,prepend: true

end
