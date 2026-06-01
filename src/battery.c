#include <stdio.h>
#include "battery.h"

int battery_mv_to_percent(int mv)
{
    if (mv < 0)
        return 0;
    else if (mv > 4200)
        return 100;
        
    return (mv * 100) / 4200;
}