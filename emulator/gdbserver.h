#ifndef GDBSERVER_H
#define GDBSERVER_H

int gdbs_await_client(int port);
int gdbs_handle_command(int csock);
int gdbs_handle_break(int csock);

#endif
