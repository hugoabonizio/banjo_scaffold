require "banjo"
module Banjo
  VIEWS_PATH = "#{__DIR__}/../app/views/"
end
require "../app/controllers/*"
require "./routes"


port = 3000
handlers = [] of HTTP::Handler
handlers << HTTP::LogHandler.new
handlers << Banjo::Handler.new
server = HTTP::Server.new(port, handlers)
puts "Starting Banjo on port #{port}..."
server.listen
