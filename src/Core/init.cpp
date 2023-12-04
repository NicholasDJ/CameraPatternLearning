/**
 * @file init.cpp
 * @author Nick Jagdeo
 * @brief Source file for initialization functions
 * @version 0.1
 * @date 2023-12-02
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <cstdint>
#include <iostream>
#include "./init.h"
#include "./../IO/Hardware/esp32.h"

int32_t init_hardware(void)
{
    int32_t status = false;
    
    /* Initialize ESP32 */
    status = static_cast<int32_t>(esp_init());
    /* Output Error */
    if ( status != ESP_ERROR_OK )
    {
        std::cout << status << std::endl;
    }

    /* Initialize Other Subsystems */

    return status;
}
