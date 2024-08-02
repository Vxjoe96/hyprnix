{ config, pkgs, inputs, ... }:
{
    systemd.user.services.battery-profile-auto = {
        Unit = {
            Description = "Watch battery states and switch power profile accordenly";
        };
        Install = {
            WantedBy = ["default.target"];
        };
        Service = {
            ExecStart = "${pkgs.writeShellScript "auto-profile-batt" ''
            #!/run/current-system/sw/bin/bash
            BAT=$(echo /sys/class/power_supply/BAT*)
            BAT_STATUS="$BAT/status"
            BAT_CAP="$BAT/capacity"
            LOW_BAT_PERCENT=20

            AC_PROFILE="performance"
            BAT_PROFILE="balanced"
            LOW_BAT_PROFILE="power-saver"

            # wait a while if needed
            [[ -z $STARTUP_WAIT ]] || sleep "$STARTUP_WAIT"

            # start the monitor loop
            prev=0

            while true; do
            	# read the current state
            	if [[ $(cat "$BAT_STATUS") == "Discharging" ]]; then
            		if [[ $(cat "$BAT_CAP") -gt $LOW_BAT_PERCENT ]]; then
            			profile=$BAT_PROFILE
            		else
            			profile=$LOW_BAT_PROFILE
            		fi
            	else
            		profile=$AC_PROFILE
            	fi

            	# set the new profile
            	if [[ $prev != "$profile" ]]; then
            		echo setting power profile to $profile
            		powerprofilesctl set $profile
            	fi

            	prev=$profile

            	# wait for the next power change event
            	inotifywait -qq "$BAT_STATUS" "$BAT_CAP"
            done
            ''};
        };
    };
}