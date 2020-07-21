/*!
    \file  usbh_usr.c
    \brief the user callback function definitions
    
    \version 2017-06-28, V1.0.0, demo for GD32F3x0
    \version 2019-06-01, V2.0.0, demo for GD32F3x0
*/

/*
    Copyright (c) 2019, GigaDevice Semiconductor Inc.

    Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this 
       list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright notice, 
       this list of conditions and the following disclaimer in the documentation 
       and/or other materials provided with the distribution.
    3. Neither the name of the copyright holder nor the names of its contributors 
       may be used to endorse or promote products derived from this software without 
       specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY 
OF SUCH DAMAGE.
*/

#include "usbh_usr.h"
#include "usbh_hid_mouse.h"
#include "usbh_hid_keybd.h"

#include "lcd_log.h"
#include <string.h>

#define KYBRD_FIRST_COLUMN        (uint16_t)0
#define KYBRD_LAST_COLUMN         (uint16_t)240
#define KYBRD_FIRST_LINE           (uint16_t)124
#define KYBRD_LAST_LINE            (uint16_t)244

#define SMALL_FONT_COLUMN_WIDTH             8
#define SMALL_FONT_LINE_WIDTH               16

uint16_t KeybrdCharXpos = 0;
uint16_t KeybrdCharYpos = 0;
uint8_t  user_input_flag = 0;
uint8_t  button_pressed_flag = 0;

extern int16_t  x_loc, y_loc;
extern __IO int16_t prev_x, prev_y;

extern usb_core_handle_struct usbfs_core_dev;

uint16_t Line = 40;

/* points to the DEVICE_PROP structure of current device */
usbh_user_callback_struct user_callback_funs =
{
    usbh_user_init,
    usbh_user_deinit,
    usbh_user_device_connected,
    usbh_user_device_reset,
    usbh_user_device_disconnected,
    usbh_user_over_current_detected,
    usbh_user_device_speed_detected,
    usbh_user_device_descavailable,
    usbh_user_device_address_assigned,
    usbh_user_configuration_descavailable,
    usbh_user_manufacturer_string,
    usbh_user_product_string,
    usbh_user_serialnum_string,
    usbh_user_enumeration_finish,
    usbh_user_userinput,
    NULL,
    usbh_user_device_not_supported,
    usbh_user_unrecovered_error
};

/* printf messages */
const uint8_t MSG_HOST_INIT[]          = "> Host Library Initialized.";
const uint8_t MSG_DEV_ATTACHED[]       = "> Device Attached.";
const uint8_t MSG_DEV_DISCONNECTED[]   = "> Device Disconnected.";
const uint8_t MSG_DEV_ENUMERATED[]     = "> Enumeration completed.";
const uint8_t MSG_DEV_HIGHSPEED[]      = "> High speed device detected.";
const uint8_t MSG_DEV_FULLSPEED[]      = "> Full speed device detected.";
const uint8_t MSG_DEV_LOWSPEED[]       = "> Low speed device detected.";
const uint8_t MSG_DEV_ERROR[]          = "> Device fault.";

const uint8_t MSG_MSC_CLASS[]          = "> Mass storage device connected.";
const uint8_t MSG_HID_CLASS[]          = "> HID device connected.";

const uint8_t USB_HID_MouseStatus[]    = "> HID Demo Device : Mouse.";
const uint8_t USB_HID_KeybrdStatus[]   = "> HID Demo Device : Keyboard.";
const uint8_t MSG_UNREC_ERROR[]        = "> UNRECOVERED ERROR STATE.";

const uint8_t MSG_HOST_HEADER[]        = "USBFS HID Host";
const uint8_t MSG_HOST_FOOTER[]        = "USB Host Library v1.0.0";

const uint8_t MSG_LIB_START[]          = "> USB Host library started.";
const uint8_t MSG_DEV_NOSUP[]          = "> Device not supported.";
const uint8_t MSG_OVERCURRENT[]        = "> Overcurrent detected.";
const uint8_t MSG_USE_KYBD[]           = "> Use Keyboard to tape characters: ";
const uint8_t MSG_RESET_DEV[]          = "> Reset the USB device.";

const uint8_t MSG_WAIT_INPUT[]         = "> Wait for user input!";
const uint8_t MSG_USER_INPUT[]         = "> User has input!";
  
/*!
    \brief      user operation for host-mode initialization
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usbh_user_init(void)
{
    static uint8_t startup = 0;

    if (0U == startup) {
        startup = 1U;

        /* configure the User key */
        gd_eval_key_init(KEY_USER, KEY_MODE_GPIO);

        lcd_init();

        lcd_log_init();

        lcd_log_header_set((uint8_t *)MSG_HOST_HEADER, 50);

        lcd_log_print((uint8_t *)MSG_LIB_START, &Line, WHITE, BLACK);

        lcd_log_footer_set((uint8_t *)MSG_HOST_FOOTER, 20);
    }
}

/*!
    \brief      user operation for device attached
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usbh_user_device_connected(void)
{
    lcd_log_print((uint8_t *)MSG_DEV_ATTACHED, &Line, WHITE, BLACK);
}

/*!
    \brief      user operation when unrecoveredError happens
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usbh_user_unrecovered_error (void)
{
    lcd_log_print((uint8_t *)MSG_UNREC_ERROR, &Line, WHITE, BLACK);
}

/*!
    \brief      user operation for device disconnect event
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usbh_user_device_disconnected (void)
{
    lcd_log_text_zone_clear(0, 40, 240, 280);

    Line = 40;

    lcd_log_print((uint8_t *)MSG_DEV_DISCONNECTED, &Line, WHITE, BLACK);
}

/*!
    \brief      user operation for reset USB device
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usbh_user_device_reset(void)
{
    lcd_log_print((uint8_t *)MSG_RESET_DEV, &Line, WHITE, BLACK);
}

/*!
    \brief      user operation for detectting device speed
    \param[in]  device_speed: the device speed
    \param[out] none
    \retval     none
*/
void usbh_user_device_speed_detected(uint8_t device_speed)
{
    if (HPRT_PRTSPD_HIGH_SPEED == device_speed) {
        lcd_log_print((uint8_t *)MSG_DEV_HIGHSPEED, &Line, WHITE, BLACK);
    } else if (HPRT_PRTSPD_FULL_SPEED == device_speed) {
        lcd_log_print((uint8_t *)MSG_DEV_FULLSPEED, &Line, WHITE, BLACK);
    } else if (HPRT_PRTSPD_LOW_SPEED == device_speed) {
        lcd_log_print((uint8_t *)MSG_DEV_LOWSPEED, &Line, WHITE, BLACK);
    } else {
        lcd_log_print((uint8_t *)MSG_DEV_ERROR, &Line, WHITE, BLACK);
    }
}

/*!
    \brief      user operation when device descriptor is available
    \param[in]  device_desc: the device descripter
    \param[out] none
    \retval     none
*/
void usbh_user_device_descavailable(void *device_desc)
{
    uint8_t str[64];

    usb_descriptor_device_struct *p_devstr = device_desc;

    sprintf((char *)str, ">>VID: %04Xh", (uint32_t)p_devstr->idVendor);
    lcd_log_print((uint8_t *)str, &Line, YELLOW, BLACK);

    sprintf((char *)str, ">>PID: %04Xh" , (uint32_t)p_devstr->idProduct);
    lcd_log_print((uint8_t *)str, &Line, YELLOW, BLACK);
}

/*!
    \brief      USB device is successfully assigned the address 
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usbh_user_device_address_assigned(void)
{

}

/*!
    \brief      user operation when configuration descriptor is available
    \param[in]  cfg_desc: pointer to configuration descriptor
    \param[in]  itf_desc: pointer to interface descriptor
    \param[in]  ep_desc: pointer to endpoint descriptor
    \param[out] none
    \retval     none
*/
void usbh_user_configuration_descavailable(usb_descriptor_configuration_struct *cfg_desc,
                                          usb_descriptor_interface_struct *itf_desc,
                                          usb_descriptor_endpoint_struct *ep_desc)
{
    usb_descriptor_interface_struct *id = itf_desc;

    if (0x08U == (*id).bInterfaceClass) {
        lcd_log_print((uint8_t *)MSG_MSC_CLASS, &Line, YELLOW, BLACK);
    } else if(0x03U == (*id).bInterfaceClass) {
        lcd_log_print((uint8_t *)MSG_HID_CLASS, &Line, YELLOW, BLACK);
    }
}

/*!
    \brief      user operation when manufacturer string exists
    \param[in]  manufacturer_string: manufacturer string of usb device
    \param[out] none
    \retval     none
*/
void usbh_user_manufacturer_string(void *manufacturer_string)
{
    uint8_t str[64];

    sprintf((char *)str, ">>Manufacturer: %s", (char *)manufacturer_string);

    lcd_log_print((uint8_t *)str, &Line, YELLOW, BLACK);
}

/*!
    \brief      user operation when product string exists
    \param[in]  product_string: product string of usb device
    \param[out] none
    \retval     none
*/
void usbh_user_product_string(void *product_string)
{
    uint8_t str[64];

    sprintf((char *)str, ">>Product: %s", (char *)product_string);

    lcd_log_print((uint8_t *)str, &Line, YELLOW, BLACK);
}

/*!
    \brief      user operatin when serialNum string exists
    \param[in]  serial_num_string: serialNum string of usb device
    \param[out] none
    \retval     none
*/
void usbh_user_serialnum_string(void *serialnum_string)
{
    uint8_t str[64];

    sprintf((char *)str, ">>Serial Number: %s", (char *)serialnum_string);

    lcd_log_print((uint8_t *)str, &Line, YELLOW, BLACK);
}

/*!
    \brief      user response request is displayed to ask for application jump to class
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usbh_user_enumeration_finish(void)
{
    /* enumeration complete */
    uint8_t Str1[] = "> To start the HID class operations: ";
    uint8_t Str2[] = "> Press User Key...                  ";

    lcd_log_print((uint8_t *)MSG_DEV_ENUMERATED, &Line, WHITE, BLACK);
    lcd_log_print(Str1, &Line, GREEN, BLACK);
    lcd_log_print(Str2, &Line, GREEN, BLACK);
} 

/*!
    \brief      user operation when device is not supported
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usbh_user_device_not_supported(void)
{
    lcd_log_print((uint8_t *)MSG_DEV_NOSUP, &Line, WHITE, BLACK);
}

/*!
    \brief      user action for application state entry
    \param[in]  none
    \param[out] none
    \retval     none
*/
usbh_user_status_enum usbh_user_userinput(void)
{
    usbh_user_status_enum usbh_usr_status = USBH_USER_NO_RESP;
    if (0U == user_input_flag) {
        user_input_flag = 1U;
    }

    /*key B3 is in polling mode to detect user action */
    if (RESET == gd_eval_key_state_get(KEY_USER)) {
        usbh_usr_status = USBH_USER_RESP_OK;
    }

    return usbh_usr_status;
}

/*!
    \brief      user operation for device overcurrent detection event
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usbh_user_over_current_detected (void)
{
    lcd_log_print((uint8_t *)MSG_OVERCURRENT, &Line, WHITE, BLACK);
}

/*!
    \brief      init mouse window
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usr_mouse_init (void)
{
    lcd_log_print((uint8_t *)USB_HID_MouseStatus, &Line, WHITE, BLACK);

    lcd_log_text_zone_clear(0, 40, 240, 280);
    lcd_rect_draw(20, 60, 200, 140, YELLOW);

    lcd_rect_color_draw(20, 220, 60, 260, WHITE);
    lcd_rect_color_draw(100, 220, 140, 260, WHITE);
    lcd_rect_color_draw(180, 220, 220, 260, WHITE);

    hid_mouse_button_released(0);
    hid_mouse_button_released(1);
    hid_mouse_button_released(2);

    lcd_draw_font_gbk16(24, 64, GREEN, BLACK, (char *)"x");

    x_loc  = 0;
    y_loc  = 0; 
    prev_x = 0;
    prev_y = 0;
}

/*!
    \brief      process mouse data
    \param[in]  data: mouse data to be displayed
    \param[out] none
    \retval     none
*/
void usr_mouse_process_data(hid_mouse_data_struct *data)
{
    uint8_t idx = 1;
    static uint8_t b_state[3] = {0};

    if ((data->x != 0) && (data->y != 0))
    {
        hid_mouse_position_update(data->x, data->y);
    }

    for ( idx = 0; idx < 3; idx ++)
    {
        if(data->button & 1 << idx) 
        {
            if(b_state[idx] == 0)
            {
                hid_mouse_button_pressed (idx);
                b_state[idx] = 1;
            }
        }
        else
        {
            if(b_state[idx] == 1)
            {
                hid_mouse_button_released (idx);
                b_state[idx] = 0;
            }
        }
    }
}

/*!
    \brief      init keyboard window
    \param[in]  none
    \param[out] none
    \retval     none
*/
void  usr_keybrd_init (void)
{
    lcd_log_text_zone_clear(0, 40, 240, 280);

    lcd_log_print((uint8_t *)USB_HID_KeybrdStatus, &Line, WHITE, BLACK);

    lcd_log_print((uint8_t *)MSG_USE_KYBD, &Line, WHITE, BLACK);

    lcd_line_draw(0, 120, 240, 120, GREEN);

    KeybrdCharXpos = KYBRD_FIRST_LINE;
    KeybrdCharYpos = KYBRD_FIRST_COLUMN;

    lcd_line_draw(0, 260, 240, 260, GREEN);
}

/*!
    \brief      process keyboard data
    \param[in]  data: keyboard data to be displayed
    \param[out] none
    \retval     none
*/
void usr_keybrd_process_data (uint8_t data)
{
    if(data == '\n')
    {
        KeybrdCharYpos = KYBRD_FIRST_COLUMN;

        /* Increment char X position */
        KeybrdCharXpos += SMALL_FONT_LINE_WIDTH;
    }
    else if (data == '\r')
    {
        /* Manage deletion of charactter and upadte cursor location */
        if(KeybrdCharYpos == KYBRD_FIRST_COLUMN) 
        {
            /* First character of first line to be deleted */
            if(KeybrdCharXpos == KYBRD_FIRST_LINE)
            {
                KeybrdCharYpos = KYBRD_FIRST_COLUMN;
            }
            else
            {
                KeybrdCharXpos -= SMALL_FONT_LINE_WIDTH;
                KeybrdCharYpos =(KYBRD_LAST_COLUMN+SMALL_FONT_COLUMN_WIDTH); 
            }
        }
        else
        {
            KeybrdCharYpos += SMALL_FONT_COLUMN_WIDTH;
        }

        lcd_draw_font_gbk16(KeybrdCharYpos, KeybrdCharXpos, BLACK, BLACK, (char *)" ");
    }
    else
    {
        char str[2] = {'\0'};

        str[0] = (char)data;

        lcd_draw_font_gbk16(KeybrdCharYpos, KeybrdCharXpos, WHITE, BLACK, str);

        /* Update the cursor position on LCD */

        /* Increment char Y position */
        KeybrdCharYpos += SMALL_FONT_COLUMN_WIDTH;

        /*Check if the Y position has reached the last column*/
        if(KeybrdCharYpos == KYBRD_LAST_COLUMN)
        {
            KeybrdCharYpos = KYBRD_FIRST_COLUMN;

            /*Increment char X position*/
            KeybrdCharXpos += SMALL_FONT_LINE_WIDTH;
        }
    }

    if(KeybrdCharXpos >= KYBRD_LAST_LINE)
    {
        lcd_rect_color_draw(0, 124, 240, 256, BLACK);

        KeybrdCharXpos = KYBRD_FIRST_LINE;
    }
}

/*!
    \brief      deinit user state and associated variables
    \param[in]  none
    \param[out] none
    \retval     none
*/
void usbh_user_deinit(void)
{
}
