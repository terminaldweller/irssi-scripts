__END__

=head1 NAME

Irssi::Windowitem

=head1 DESCRIPTION


The meaning of "window" should be pretty clear, but "window item" is something I
couldn't really figure out a better name for :) They're simply something that's
inside a window, a channel or a query usually.  Windows can have multiple items
inside them. It's possible to create non-channel/query window items too,
currently the third possible window item is created by /EXEC -interactive.

In scripts, I think you can quite safely assume that the window item is
query or channel if the script is intended to be run in one of them.
Stupid users won't probably have other window items, and smart users
know where to run the script, or at least later figure out why it
didn't work :)

=head1 FIELDS

Windowitem->{}
  type - Type of the window item, for example "CHANNEL" or "QUERY"
  chat_type - String ID of chat protocol, for example "IRC"

  server - Active server for item
  name - Name of the item

  createtime - Time the window item was created
  data_level - 0=no new data, 1=text, 2=msg, 3=highlighted text
  hilight_color - Color of the last highlighted text

=head1 METHODS

Windowitem::print(str[, level])

Windowitem::command(cmd)


