def ping_site_map
  require 'uri'
  require 'net/http'
  %x[say Pinging the googles]
  sleep 2
  puts Net::HTTP.get URI.parse('http://www.google.com/webmasters/tools/ping?sitemap=http%3A%2F%2Fwww.packlate.com%2Fsitemap.xml')
  %x[say Googles Pinged!!!]
end
namespace :example do
  task :thread do
    puts "Threading..."
    t = Thread.fork {ping_site_map}
    sleep 5
    puts "Done..."
  end
  
  task :fork do
    puts "Forking..."
    pid = fork {ping_site_map}
    Process.detach(pid)
    puts "Done..."
  end
end