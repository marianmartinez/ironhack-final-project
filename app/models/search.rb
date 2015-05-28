class Search
  def self.query(term, options = {})
    return [] if term.blank?
    GoogleBooks.search("#{term}", default_options.merge(options))
  end

  private

  def self.default_options
    {
      count:  10,
      page:   1,
      api_key: 'AIzaSyCGZFL2tOiMcg3G5V4KC6ViLQcnrt29Jo4'
    }
  end

end
