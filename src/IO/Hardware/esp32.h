/**
 * @file esp32.h
 * @author Nick Jagdeo
 * @brief Header file for esp32 interface app
 * @version 0.1
 * @date 2023-12-02
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "esp_defines.h"

ESP_ERROR_CODE esp_init(void);
ESP_ERROR_CODE esp_connect(void);