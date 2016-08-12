#ifndef GDBSERVER_H
#define GDBSERVER_H

typedef struct gdbs_AddrListNode_s {
    unsigned int addr;
    struct gdbs_AddrListNode_s *next;
} gdbs_AddrListNode;

extern gdbs_AddrListNode *gdbs_first_breakpoint;
extern gdbs_AddrListNode *gdbs_first_read_watchpoint;
extern gdbs_AddrListNode *gdbs_first_write_watchpoint;

int gdbs_await_client(int port);
int gdbs_handle_command(int csock);
int gdbs_handle_break(int csock);
void gdbs_add_addr_to_list(unsigned int addr, gdbs_AddrListNode **head);
void gdbs_remove_addr_from_list(unsigned int addr, gdbs_AddrListNode **head);
void gdbs_add_breakpoint(unsigned int addr);
void gdbs_remove_breakpoint(unsigned int addr);
int gdbs_has_breakpoint(unsigned int addr);

#endif
