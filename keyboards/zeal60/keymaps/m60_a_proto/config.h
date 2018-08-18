#ifndef CONFIG_USER_H
#define CONFIG_USER_H

#include "../../config.h"

// This fixes the diodes mounted reversed (fab fail) on M60-A prototype
#undef DIODE_DIRECTION
#define DIODE_DIRECTION ROW2COL

// This conditionally compiles the backlight code for M60-A specifics
#define CONFIG_M60_A

/* enable/disable LEDs based on layout */
#undef BACKLIGHT_USE_SPLIT_BACKSPACE
#define BACKLIGHT_USE_SPLIT_BACKSPACE 1

#undef BACKLIGHT_USE_SPLIT_LEFT_SHIFT
#define BACKLIGHT_USE_SPLIT_LEFT_SHIFT 0

#undef BACKLIGHT_USE_SPLIT_RIGHT_SHIFT
#define BACKLIGHT_USE_SPLIT_RIGHT_SHIFT 1

#undef BACKLIGHT_USE_7U_SPACEBAR
#define BACKLIGHT_USE_7U_SPACEBAR 1

#undef BACKLIGHT_USE_ISO_ENTER
#define BACKLIGHT_USE_ISO_ENTER 0

#undef BACKLIGHT_DISABLE_HHKB_BLOCKER_LEDS
#define BACKLIGHT_DISABLE_HHKB_BLOCKER_LEDS 1

#endif //CONFIG_USER_H 
