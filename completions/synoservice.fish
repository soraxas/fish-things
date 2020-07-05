
function __fish_synoservice_get_services
  sudo synoservice --list
end

complete -c synoservice -l help -d "Show this help"
complete -c synoservice -l help-dev -d "More specialty functions for deveplopment"
complete -c synoservice -l list -d "List all available services"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l start -d "start the service"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l stop -d "stop the service"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l hard-start -d "start the service and its dependency"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l hard-stop -d "stop the service and its dependency"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l is-enabled -d "Check if the service is enabled"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l status -d "Get the status of specified services"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l enable -d "Set runkey to yes and start the service"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l disable -d "Set runkey to no and stop the service"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l hard-enable -d "Set runkey to yes and start the service and its dependency"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l hard-disable -d "Set runkey to no and stop the service and its dependency"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l restart -d "Restart the given service"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l reload -d "Reload the given service"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l pause -d "Pause the given service"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l resume -d "Resume the given service"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l pause-by-reason -d "Pause the service by given reason"
complete -c synoservice -x -a '(__fish_synoservice_get_services)' -l resume-by-reason -d "Resume the service by given reason"
complete -c synoservice -x -l pause-all -d "Pause all service by given reason with optional event(use -p to include packages)"
complete -c synoservice -x -l pause-all-no-action -d "Set all service runkey to no but leave the current service status(use -p to include packages)"
complete -c synoservice -x -l resume-all -d "Resume all service by given reason(use -p to include packages)"
complete -c synoservice -x -a "(printf '%s\ttype\n' 'file_protocol' 'application')" -l reload-by-type -d "Reload services with specified type"
complete -c synoservice -x -a "(printf '%s\ttype\n' 'file_protocol' 'application')" -l restart-by-type -d "Restart services with specified type"
