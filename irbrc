begin
  require "irb/completion"

  # Gross - fix this
  require "/Users/andy/.rbenv/versions/1.9.3-p327/lib/ruby/gems/1.9.1/gems/wirble-0.1.3/lib/wirble.rb"
  require "/Users/andy/.rbenv/versions/1.9.3-p327/lib/ruby/gems/1.9.1/gems/awesome_print-1.1.0/lib/awesome_print.rb"

  Wirble.init
  Wirble.colorize

  AwesomePrint.defaults = {
    :indent => -2
  }

rescue LoadError => err
  warn "LoadError: #{err}"
end
