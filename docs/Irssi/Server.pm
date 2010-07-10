__END__

=head1 NAME

Irssi::Server

=head1 FIELDS

Server->{}
  type - "SERVER" text
  chat_type - String ID of chat protocol, for example "IRC"

  (..contains all the same data as Connect above..)

  connect_time - Time when connect() to server finished
  real_connect_time - Time when server sent "connected" message

  tag - Unique server tag
  nick - Current nick

  connected - Is connection finished? 1|0
  connection_lost - Did we lose the connection (1) or was
                    the connection just /DISCONNECTed (0)

  rawlog - Rawlog object for the server

  version - Server version
  last_invite - Last channel we were invited to
  server_operator - Are we server operator (IRC op) 1|0
  usermode_away - Are we marked as away? 1|0
  away_reason - Away reason message
  banned - Were we banned from this server? 1|0
  lag - Current lag to server in milliseconds

=head1 METHODS

Server::channels() - return list of channels in server
Server::queries() - return list of queries in server
Server::print(channel, str[, level])
Server::command(cmd)


Server
Connect::connect()
  Connect to server.

Server::disconnect()
  Disconnect from server.

Server
server_find_tag(tag)
  Find server with tag

Server
server_find_chatnet(chatnet)
  Find first server that is in `chatnet'

Server::isnickflag(flag)
  Returns 1 if flag is a nick mode flag (@, + or % in IRC)

Server::ischannel(data)
  Returns 1 if start of `data' seems to mean channel.

Server::get_nick_flags()
  Returns nick flag characters in order: op, voice, halfop ("@+%" in IRC).

Server::send_message(target, msg, target_type)
  Sends a message to nick/channel. target_type 0 = channel, 1 = nick

