#include <stddef.h>
#include "ota_validator.h"

int validate_firmware(const firmware_info_t *fw) {
    if (fw == NULL) {
        return -1;
    }

    if (fw->version == 0) {
        return -1;
    }

    if (fw->checksum == 0) {
        return -1;
    }

    if (fw->size < 1024) {
        return -1;
    }

    return 0; // Firmware is valid
}
