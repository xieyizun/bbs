class ApplicationController < ActionController::Base
  protect_from_forgery
  #helper默认只能在视图中使用,要在controller中,使用
  #就需要包含一下语句
  include SessionsHelper
end
