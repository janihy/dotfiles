rule = {
  matches = {
    {
      { "device.name", "equals", "alsa_card.usb-Generic_USB_Audio_200901010001-00" },
    },
  },
  apply_properties = {
    ["device.disabled"] = true,
  },
}

table.insert(alsa_monitor.rules,rule)
