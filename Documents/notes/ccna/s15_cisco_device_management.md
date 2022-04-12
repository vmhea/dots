# Cisco Device Management


### The Boot Up Process
-----------------------
#### Cisco Device Memory
* ROM - Read Only Memory
* Flash
* NVRAM - Non-Volatile RAM
* RAM - Random Access Memory

#### ROM - Read Only Memory
* When the device is powered on, it will first load from ROM
* Two main functions are performed:
    1. Power On Self Test (POST)
    2. Load bootstrap
* The bootstrap will look in Flash for an IOS software image to load

#### ROMMON - ROM Monitor
* If an IOS image cannot be found the device will show the ROMMON prompt at the command line
* The ROM Monitor can be used to recover a missing or corrupted software image
* In this case you can boot from USB or an external TFTP server
* Search for 'Cisco ROMMON Recovery' for your device model

#### Flash Memory
* The system will load the first IOS image found in Flash by default
* You can override this with the `boot system` command
* You can copy additional IOS system images to Flash via TFTP or USB

#### NVRAM - Non-Volatile RAM Memory
* When the system has finished loading the IOS system image from FLASH, it will load the startup-config configuration file from NVRAM
* The saved startup-config becomes the current running-config in RAM
* If no startup-config file is found, the device will load the Setup Wizard

* Whenever you enter a command in IOS it takes effect immediately and goes into the running-config
* To make your changes permanent across a reboot:
    `copy running-config startup-config`

#### RAM - Random Access Memory
* The IOS system image and startup-config are loaded from Flash and NVRAM into RAM during bootup
* RAM is used as the normal working memory of the device
* ROM, Flash and NVRAM are permanent memory, their contents are not lost when the device is powered off or rebooted
* RAM is volatile memory, its contents are lost when the device is powered off

* The VLAN Database
    a. On a switch, the VLAN database (vlan.dat) is saved in either Flash or NVRAM, depending on the model of switch

* Booting from TFTP
    a. The system can also load a system image and/or startup-config from an external TFTP server instead of Flash/NVRAM
    b. This is not recommended because the device will not be able to boot if it loses connectivity to the server. It is usually only used where the device does not have enough capacity in Flash to save the system image


### Factory Reset and Password Recovery
---------------------------------------
#### Factory Reset
* To factory reset a router or switch: `write erase`
* This will erase the startup-config
* `reload` to boot up with a blank configuration
* The Setup Wizard will run

#### The Config Register
* The configuration register can be used to change the way the router boots
* Use the `config-register` command in global configuration mode or `confreg` at the ROMMON prompt
* Eg `config-register 0x2142`

* 0x2102: boot normally (default)
* 0x2120: boot into rommon
* 0x2142: ignore contents of NVRAM (startup-config)

#### Router Password Recovery Procedure
*Keep existing config while only changing enable secret*

* Press the break sequence (<C-Break>) at power on to break into rommon prompt
* `confreg 0x2142` to ignore the startup-config on boot
* The startup-config is still there with the full configuration including the unknown enable secret, but the router does not use it when it boots
* `reset` to reload
* The router will bootup with no configuration. Type `no` to bypass the setup wizard
* Enter enable mode. You will not be prompted for the enable secret as it is not in the running configuration

* Copy the startup config to the running config
* This will copy the entire previous configuration into the running config including the unknown enable secret. You are already in enable mode so you do not need to know what it is.
* Enter a new enable secret in global configuration mode to overwrite the old one. This will go into the running config
* `config-register 0x2102` so the router will boot normally on the next restart
* `copy run start` short for `copy running-cofig startup-config` to save the configuration. This will merge the new enable password into the existing startup-config

#### Switch Password Recovery Procedure
* The switch password recovery procedure is very similar, but you may have to physically press the `Mode` button on the front of the switch to break into the switch loader
* Search for 'Cisco password recovery' for your model of switch for full instructions


### Backing up the System Image and Config
------------------------------------------
* Copies of the device's IOS system image and configuration can be saved to Flash, FTP, TFTP, or USB
* If you copy a config file into the running-config, it will be merged with the current configuration
* To replace a configuration, factory reset and then copy the new configuration into the startup-config

    ```
    copy flash tftp
    copy running-config tftp
    copy startup-config usb
    ```


### Upgrading the IOS System Image
----------------------------------
* IOS software images can be downloaded from: `https://software.cisco.com`
* After downloading the software, copy to the device's Flash using TFTP: `copy tftp flash`
* Delete the old system image or use the `boot system` command
