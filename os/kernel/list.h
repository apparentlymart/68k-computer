#ifndef LIST_H
#define LIST_H

struct list_head_s;
struct list_head_s {
    struct list_head_s *next, *prev;
};
typedef struct list_head_s list_head;

static inline void list_init(list_head *list) {
    list->next = list;
    list->prev = list;
}

static inline void __list_ins(list_head *new, list_head *prev, list_head *next) {
    next->prev = new;
    new->next = next;
    new->prev = prev;
    prev->next = new;
}

static inline void __list_del(list_head *prev, list_head *next) {
    next->prev = prev;
    prev->next = next;
}

static inline void __list_join(list_head *head, list_head *prev, list_head *next) {
    list_head *first = head->next;
    list_head *last = head->prev;

    first->prev = prev;
    prev->next = first;

    last->next = next;
    next->prev = last;
}

static inline void list_add_after(list_head *new, list_head *after) {
    __list_ins(new, after, after->next);
}

static inline void list_add_before(list_head *new, list_head *before) {
    __list_ins(new, before->prev, before);
}

static inline void list_del(list_head *entry) {
    __list_del(entry->prev, entry->next);
    entry->next = entry;
    entry->prev = entry;
}

static inline void list_replace(list_head *old, list_head *new) {
    new->next = old->next;
    new->next->prev = new;
    new->prev = old->prev;
    new->prev->next = new;
    list_init(old);
}

static inline void list_move_after(list_head *new, list_head *after) {
    __list_del(new->prev, new->next);
    list_add_after(new, after);
}

static inline void list_move_before(list_head *new, list_head *before) {
    __list_del(new->prev, new->next);
    list_add_before(new, before);
}

static inline int list_is_empty(list_head *head) {
    return head->next == head;
}

static inline void list_join_before(list_head *new_list, list_head *head) {
    if (!list_is_empty(new_list)) {
        __list_join(new_list, head, head->next);
        list_init(new_list);
    }
}

static inline void list_join_after(list_head *new_list, list_head *head) {
    if (!list_is_empty(new_list)) {
        __list_join(new_list, head->prev, head);
        list_init(new_list);
    }
}

#define list_foreach(pos, head) \
    for (pos = (head)->next; pos != (head); pos = pos->next)

#define list_foreach_rev(pos, head) \
    for (pos = (head)->prev; pos != (head); pos = pos->prev)

#endif
