# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  
  # http://ethilien.net/archives/better-redirects-in-rails/
  def self.append_url_parameters(url, urlparams)
    new_params_query_string = ''
    first = true
    urlparams.each_pair do |param, value|
      new_params_query_string << '&`' unless first
      new_params_query_string << "#{param}=#{CGI.escape(value.to_s)}"
      first = false
    end
    uri, query = url.split('?')
    if (query.blank?)
      uri + "?" + new_params_query_string
    else
      uri + "?" + query + "&" + new_params_query_string
    end
  end


  # create link that will eventually redirect back to here
  # http://ethilien.net/archives/better-redirects-in-rails/
  def link_away(name, options = {}, html_options = nil)
    if( options.is_a?(Hash) )
      options = { :return_uri => url_for(:only_path => true) }.update(options.symbolize_keys)
    else
      options = ApplicationHelper.append_url_parameters(url_for(options), {:return_uri => url_for(:only_path => true) } )
    end
    link_to(name, options, html_options)
  end


  def return_or_back_url
    session[:original_uri] ? session[:original_uri] : :back
  end

end
