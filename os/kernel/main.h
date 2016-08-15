#ifndef MAIN_H
#define MAIN_H

extern const void *vectors[256];

void main(void);

void unhandled_exception(int vector);

#endif
