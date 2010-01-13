# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password


  before_filter :link_return


  # redirect somewhere that will eventually return back to here
  # http://ethilien.net/archives/better-redirects-in-rails/
  def redirect_away(*params)
    session[:original_uri] = request.request_uri
    redirect_to(*params)
  end

  # returns the person to either the original url from a redirect_away or to a default url
  def redirect_back(*params)
    uri = session[:original_uri]
    session[:original_uri] = nil
    if uri
      redirect_to uri
    else
      redirect_to(*params)
    end
  end


  private

  # handles storing return links in the session
  def link_return
    if params[:return_uri]
      session[:original_uri] = params[:return_uri]
    end
  end

end
