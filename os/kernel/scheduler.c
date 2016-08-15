
#include "scheduler.h"
#include "kernel.h"

sched_Process sched_processes[16];
sched_Task sched_tasks[256];

sched_TaskList sched_tasks_ready;
sched_TaskList sched_tasks_blocked;
sched_Task *sched_task_running = 0;
