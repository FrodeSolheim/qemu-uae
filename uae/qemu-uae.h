#ifndef QEMU_UAE_H
#define QEMU_UAE_H

void runstate_init(void);
void qemu_tcg_wait_io_event(void);
void qemu_wait_io_event_common(CPUState *cpu);

 /* cpus.c */

void qemu_uae_mutex_lock(void);
void qemu_uae_mutex_unlock(void);
int qemu_uae_mutex_trylock(void);
void qemu_uae_mutex_trylock_cancel(void);

/* vl.c */

void main_loop(void);
bool main_loop_should_exit(void);

/* qemu-uae-cpu.c */

bool qemu_uae_main_loop_should_exit(void);

/* qemu-uae-main.c */

void qemu_uae_set_started(void);
void qemu_uae_wait_until_started(void);

#endif /* QEMU_UAE_H */
