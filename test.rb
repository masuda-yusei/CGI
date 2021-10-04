require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
# server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
# server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
# server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'kadai_fix.html.erb')
server.mount('/kadai_goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'kadai_goya.rb')
server.mount('/kadai_goya_quality.cgi', WEBrick::HTTPServlet::CGIHandler, 'kadai_goya_quality.rb')
server.start



