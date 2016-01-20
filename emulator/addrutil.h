#ifndef ADDRUTIL_H
#define ADDRUTIL_H

#define ADDR_SUFFIX_MASK(bits) ((1 << (bits)) - 1)
#define ADDR_SUFFIX(addr, bits) (addr & ADDR_SUFFIX_MASK(bits))
#define MAP_ADDR(prefix, addr, keep_bits) (((prefix) << (keep_bits)) | ADDR_SUFFIX(addr, keep_bits))

#define MATCH_ADDR(prefix, addr, keep_bits) (((addr) & (~ADDR_SUFFIX_MASK(keep_bits))) == ((prefix) << (keep_bits)))

#endif
