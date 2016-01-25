#ifndef ADDRUTIL_H
#define ADDRUTIL_H

#define ADDR_MATCH(addr, base, mask) (((addr) & (mask)) == (base))
#define MAP_ADDR(addr, logbase, phybase) ((phybase) + ((addr) - (logbase)))

#endif
