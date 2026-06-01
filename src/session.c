#include <stddef.h>
#include "session.h"

int create_session(payment_session_t *session, uint32_t id, uint32_t amount) {
    // Quality Gate 1: Null pointer check
    if (session == NULL) {
        return -1;
    }

    // Quality Gate 2: Zero amount check
    if (amount == 0) {
        return -1;
    }

    // Assign validated payload variables
    session->session_id = id;
    session->amount = amount;

    return 0; // Success
}
