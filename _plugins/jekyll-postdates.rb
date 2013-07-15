STDERR.puts 'Running with ISO 8601 datestamp support'
 
module Jekyll
  class Post
    # A new way of recognising posts.
    remove_const(:MATCHER)
    MATCHER = /^(.+\/)*(?:\+|-)?(\d{4,})(?:(?:(?:-(0[1-9]|1[012])-|(0[1-9]|1[012]))(0[1-9]|[12][0-9]|3[01]))|(?:-?(00[1-9]|0[1-9]\d|[12]\d\d|3[0-5]\d|36[0-6])))-(.*)(\.[^.]+)$/
 
    # Processing the new dates.
    def process(name)
      m, cats, year, month1, month2, day, orday, slug, ext = *name.match(MATCHER)
      if orday
        date = (Date.ordinal(year.to_i,orday.to_i)).to_s
      else
        date = year+"-"+(month1||month2)+"-"+day
      end
      self.date = Time.parse(date)
      self.slug = slug
      self.ext = ext
    rescue ArgumentError
      raise FatalException.new("Post #{name} does not have a valid date.")
    end
 
    # Modifying the permalink processing.
    def url
      return @url if @url
      url = if permalink
        permalink
      else
        {
          "longnow" => "%05d" % date.strftime("%Y"),
          "year" => date.strftime("%Y"),
          "month" => date.strftime("%m"),
          "day" => date.strftime("%d"),
          "yday" => date.strftime("%j"),
          "title" => CGI.escape(slug),
          "i_month" => date.strftime("%m").to_i.to_s,
          "i_day" => date.strftime("%d").to_i.to_s,
          "i_yday" => date.strftime("%j").to_i.to_s,
          "categories" => categories.join('/'),
          "output_ext" => self.output_ext
        }.inject(template) { |result, token|
          result.gsub(/:#{Regexp.escape token.first}/, token.last)
        }.gsub(/\/\//, "/")
      end
      # sanitize url
      @url = url.split('/').reject{ |part| part =~ /^\.+$/ }.join('/')
      @url += "/" if url =~ /\/$/
      @url
    end
  end
end