#ifndef SCHEDULER_H
#define SCHEDULER_H

// Our scheduler is a simple, single-CPU round-robin design, with zero or
// one tasks running at any given time.
//
// At present it does not support task priorities and just treats all
// tasks as equally important. The goal is for this to eventually change
// and support at least a basic three-level priority system (LOW, NORMAL, HIGH)

#include "kernel.h"
#include <stdint.h>

// MC68000 registers
typedef struct {
    uint32_t d0;
    uint32_t d1;
    uint32_t d2;
    uint32_t d3;
    uint32_t d4;
    uint32_t d5;
    uint32_t d6;
    uint32_t d7;
    uint32_t a0;
    uint32_t a1;
    uint32_t a2;
    uint32_t a3;
    uint32_t a4;
    uint32_t a5;
    uint32_t a6;
    uint32_t a7;
    uint32_t pc;
    uint16_t status;
} sched_TaskState;

// A sched_ProcessID is either an index into the process table or
// the special value SCHED_KERNEL_PROC, which represents the kernel
// itself.
// In some contexts, can also be SCHED_NO_PROCESS to represent
// an uninitialized table entry.
typedef unsigned char sched_ProcessID;

// sched_ThreadID is an index into the thread table.
typedef unsigned char sched_ThreadID;

typedef struct {
    sched_ProcessID parent_id;
    unsigned char task_count; // essentially a task reference counter
} sched_Process;

typedef struct sched_Task_s {
    // When a task is in a task list, these fields are used
    // to traverse that list.
    struct sched_Task_s *prev;
    struct sched_Task_s *next;

    // This is the main data we keep about a thread, regardless of
    // what list it happens to be in.
    sched_ThreadID id;
    sched_ProcessID process_id;
    sched_TaskState state; // Updated each time task execution is suspended
} sched_Task;

// A sched_TaskList is effectively the head of a task list.
// The first item in a list considers the head to be its predecessor,
// and the last item considers the head to be its successor, even though
// the head is not actually itself a task. Thus when traversing a list
// it's important to know which list head you're working from and test
// whether you've found it before attempting to access the main task
// attributes.
typedef struct {
    struct sched_Task_s *last;
    struct sched_Task_s *first;
} sched_TaskList;

#define SCHED_KERNEL_TASK 0xff
#define SCHED_NO_PROCESS 0xee

// The process table entries map 1:1 with user-space page tables, so
// each process has its own address space and we can have up to 16 processes.
// The special process SCHED_KERNEL_TASK does not have an entry in this
// table, and instead its parent is considered to be the kernel itself,
// running within the supervisor address space.
// Entries with a process_id of SCHED_NO_PROCESS are not currently in use.
extern sched_Process sched_processes[16];

// This table of all tasks is primarily accessed via several linked lists
// overlaid on it, though the array may be used directly to look up a
// thread by its id.
extern sched_Task sched_tasks[256];

extern sched_TaskList sched_tasks_ready;
extern sched_TaskList sched_tasks_blocked;
extern sched_Task *sched_task_running;

// Checks the scheduler state and either begins executing a task, if
// there's at least one ready to run, or puts the CPU to sleep if
// all tasks are currently blocked.
// Either way this does not return; control returns to the kernel
// only via exception handling.
void __attribute__((noreturn)) sched_schedule(void);

#endif
