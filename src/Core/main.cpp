/**
 * @file main.cpp
 * @author Nick Jagdeo
 * @brief Entry Point for the entire program
 * @version 0.1
 * @date 2023-11-26
 * 
 * @copyright Copyright (c) 2023
 * 
 */

/* Defines */

/* Includes */
#include "./main.h"
#include "./init.h"
#include <iostream>


int main()
{
    int32_t status = 0;

    /* Initialization */
    status = init_hardware();

    /* Main Loop - Infinite Cycle */
    while (true)
    {
        if (status != 0)
        {
            /* Error as Occured - Break Loop */
            break;
        }
    }

    /* Error Check */
    std::cout << status << std::endl;

    return 0;
}
