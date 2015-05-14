class MonkeyTester::RandomWalker
  include Capybara::DSL

  def initialize(options)
    @url = options[:url]
    @scheme = URI.parse(@url).scheme
    @host = URI.parse(@url).host
    @login = options[:login]
    @debug = options[:debug]
  end

  def walk
    visit @url

    while true
      begin
        login @login[:url] and next if page.current_url == @login[:url]
        puts [page.status_code, page.current_url, page.title].join("\t")
        next_link = all('a').reject{
          |a| a[:href] !~ /^#{@scheme}:\/\/#{@host}/ && a[:href] =~ /:\/\//
        }.sample
        page.evaluate_script('window.history.back()') and next unless next_link
        puts [next_link, next_link[:href], next_link.text].join("\t") if @debug
        next_link.click
      rescue Capybara::Poltergeist::MouseEventFailed => e
        # just ignore
      rescue => e
        puts e
        puts e.message
      end
    end
  end

  private

  def login(url)
    visit url
    fill_in @login[:id][:label], with: @login[:id][:value]
    fill_in @login[:password][:label], with: @login[:password][:value]
    click_button(@login[:button][:value])
  end

end
