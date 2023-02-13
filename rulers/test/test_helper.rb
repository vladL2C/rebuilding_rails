require "minitest/autorun"
require "rack/test"

# Always use local Rulers first
this_dir = File.join(File.dirname(__FILE__), "..", "lib")
$LOAD_PATH.unshift File.expand_path(this_dir)

require "rulers"
