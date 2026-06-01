#include <stdio.h>
#include "version.h"
#include "battery.h"

int main(void)
{
    // Simulating a reading of 3650 mV
    int mock_mv = 3650;
    int percent = battery_mv_to_percent(mock_mv);

    printf("Firmware Version: %s\n", FW_VERSION);
    printf("Git SHA: %s\n", GIT_SHA);
    printf("Battery: %d%%\n", percent);

    return 0;
}
