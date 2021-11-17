# Script that uses the ferrum gem to generate screenshots from a headless browser

require 'ferrum'
require 'optparse'

options = {show_help: false, out: "out.png"}

opts = OptionParser.new do |o|
  o.banner = "Usage: #{File.basename($0)} [options]\n\n"
  o.on("--url str","-u", "Fetch URL") do |url|
    options[:url] = url
  end
  o.on("--out str","-o", "Output file") do |out|
    options[:out] = out
  end
  o.on("--extract str", "Extract dimensions") do |dim|
    options[:extract] = dim
  end

  o.on_tail('-h', '--help', 'Display this help and exit') do
    options[:show_help] = true
  end
end
begin
  opts.parse!(ARGV)

  if options[:show_help]
    print opts
    print USAGE
    exit 0
  end

rescue OptionParser::InvalidOption => e
  options[:invalid_argument] = e.message
end

print("\nProcessing #{options[:url]}...")
browser = Ferrum::Browser.new
browser.timeout = 20
browser.go_to(options[:url])
browser.screenshot(path: options[:out])
browser.quit

if options[:extract]
  print `convert -extract #{options[:extract]} #{options[:out]} convert.png`
  File.rename("convert.png",options[:out])
end
