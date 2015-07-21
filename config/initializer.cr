require "banjo"
module Banjo
  VIEWS_PATH = "#{__DIR__}/../app/views/"
end
require "../app/controllers/*"
require "./routes"

if ENV["PORT"]?.nil?
  port = 3000
else
  port = ENV["PORT"].to_i
end
handlers = [] of HTTP::Handler
handlers << HTTP::LogHandler.new
handlers << Banjo::Handler.new
server = HTTP::Server.new(port, handlers)
puts "Starting Banjo on port #{port}..."
server.listen
