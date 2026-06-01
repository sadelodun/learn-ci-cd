#ifndef SESSION_H
#define SESSION_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct
{
    uint32_t session_id;
    uint32_t amount;
} payment_session_t;

int create_session(payment_session_t *session,
                   uint32_t id,
                   uint32_t amount);

#ifdef __cplusplus
}
#endif

#endif /* SESSION_H */
