/*
    brcm63xx_adsl_drv
    Copyright (C) 2015  Rhys Kidd <rhyskidd@gmail.com>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Rhys Kidd");
MODULE_DESCRIPTION("Broadcom brcm63xx ADSL driver");

static int __init adsl_init(void)
{
    printk(KERN_INFO "Hello adsl world.\n");
    return 0;
}

static void __exit adsl_cleanup(void)
{
    printk(KERN_INFO "Cleaning up adsl module.\n");
}

module_init( adsl_init );
module_exit( adsl_cleanup );
