#ifndef OTA_VALIDATOR_H
#define OTA_VALIDATOR_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct
{
    uint32_t version;
    uint32_t checksum;
    uint32_t size;
} firmware_info_t;

int validate_firmware(const firmware_info_t *fw);

#ifdef __cplusplus
}
#endif

#endif /* OTA_VALIDATOR_H */
