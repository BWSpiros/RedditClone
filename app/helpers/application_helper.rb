module ApplicationHelper

  def current_user
    User.find_by_token(session[:token])
  end

  def logged_in?
    !!current_user
  end

  def auth
    "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}' >".html_safe
  end

  def flash_errors(notice_set = [ flash[:errors], flash[:error], flash[:notice], flash[:notices] ])
    notice_set.inject("") do |r, e|

      e.nil? ? r : r + e

    end.html_safe

  end

end
