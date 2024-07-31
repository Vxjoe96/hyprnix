
pkgs: {
  powermenu = pkgs.writeShellScriptBin "powermenu" ''
    # Define the entries for the menu with special characters
    entries=" Lock\n⏾ Suspend\n Reboot\n⏻ Shutdown"
    
    # Use echo to send entries to anyrun via stdin, capture the selection
    selected=$(echo -e "$entries" | fuzzel -d | awk '{print tolower($2)}')
    
    # Use a case statement to execute different actions based on the selected option
    case $selected in
      lock)
        loginctl lock-session;;   # If "lock" is selected, lock the current session using loginctl
      suspend)
        exec systemctl suspend;;  # If "suspend" is selected, suspend the system using systemctl
      reboot)
        exec systemctl reboot;;   # If "reboot" is selected, reboot the system using systemctl
      shutdown)
        exec systemctl poweroff -i;;  # If "shutdown" is selected, power off the system using systemctl with interactive confirmation
    esac
  '';
}
