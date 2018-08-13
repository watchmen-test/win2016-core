builders {
    type="hyperv-iso"
    iso_url="C:/tools/ISOs/win2016.iso"
    iso_checksum_type="none"
    enable_secure_boot=true,
    output_directory="./output"
    communicator="winrm"
    winrm_password="{{ user `winrm_password` }}"
    winrm_username="{{ user `winrm_username` }}"
    winrm_timeout="4h"
    shutdown_command="%WINDIR%/System32/Sysprep/Panther/SysPrep.exe /generalize /mode:vm /shutdown"
    switch_name="{{ user `vm_switch` }}"
    floppy_files=[
        "{{user `base_location` }}/Autounattend.xml",
        "{{user `scripts` }}/run-sysprep.cmd"
    ]
}

post-processors {
    type="vagrant",
    keep_input_artifact=false,
    output="{{.Provider}}_windows-2016.box"
}

post-processors{
   type="vagrant-cloud",
   box_tag="watchmen-test/windows-server-2016",
   access_token="{{user `cloud_token`}}",
   version="{{user `version`}}"
}

