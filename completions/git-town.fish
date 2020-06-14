
# All Git Town commands
set git_town_commands abort alias append config continue discard hack help kill main-branch new-branch-push-flag new-pull-request offline perennial-branches prepend prune-branches pull-branch-strategy rename-branch repo set-parent-branch ship skip sync undo version 

# Indicates through its error code whether the command line to auto-complete
# already contains a Git Town command or not.
#
# - doesn't have command yet: exit code 0
# - has command already: exit code 1
# - not using town subcommand: exit code 2
function __fish_complete_git_town_no_command     
  set -l cmd (commandline -opc)     
  # Indicates if it current is using town command
  contains -- town $cmd     
  or return 2    
  for c in $cmd       
    if contains $c $git_town_commands      
      return 1    
    end    
  end    
  return 0    
end    



# Define autocompletion for the Git Town main command.
complete --command git --arguments 'town' --description 'Generic, high-level Git workflow' --condition '__fish_git_needs_command' --exclusive
complete --command git -s h -l help --description 'help for current command' --condition '__fish_git_using_command town'
complete --command git -l debug --description 'Developer tool to print git commands run under the hood' --condition '__fish_git_using_command town'

# Define autocompletion for the Git Town subcommands themselves.
#
# These only get autocompleted if there is Git Town command and no Git Town subcommand present in the
# command line already.
# This is done through __fish_complete_git_town_no_command
complete --command git --arguments "abort" --description "Aborts the last run git-town command" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "alias" --description "Adds or removes default global aliases" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "append" --description "Creates a new feature branch as a child of the current branch" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "config" --description "Displays your Git Town configuration" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "continue" --description "Restarts the last run git-town command after having resolved conflicts" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "discard" --description "Discards the saved state of the previous git-town command" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "hack" --description "Creates a new feature branch off the main development branch" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "help" --description "Help about any command" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "kill" --description "Removes an obsolete feature branch" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "main-branch" --description "Displays or sets your main development branch" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "new-branch-push-flag" --description "Displays or sets your new branch push flag" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "new-pull-request" --description "Creates a new pull request" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "offline" --description "Displays or sets offline mode" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "perennial-branches" --description "Displays your perennial branches" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "prepend" --description "Creates a new feature branch as the parent of the current branch" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "prune-branches" --description "Deletes local branches whose tracking branch no longer exists" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "pull-branch-strategy" --description "Displays or sets your pull branch strategy" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "rename-branch" --description "Renames a branch both locally and remotely" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "repo" --description "Opens the repository homepage" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "set-parent-branch" --description "Prompts to set the parent branch for the current branch" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "ship" --description "Deliver a completed feature branch" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "skip" --description "Restarts the last run git-town command by skipping the current branch" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "sync" --description "Updates the current branch with all relevant changes" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "undo" --description "Undoes the last run git-town command" --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments "version" --description "Displays the version" --condition '__fish_complete_git_town_no_command' --no-files


# Define specific subcommands autocompletion
complete -c git -n '__fish_git_using_command town; contains -- help (commandline -opc)' -d 'Help about any command' -a '(printf -- "%s\n" $git_town_commands)'
complete -c git -n '__fish_git_using_command town; contains -- append (commandline -opc)' -xa '(__fish_git_branches)'
complete -c git -n '__fish_git_using_command town; contains -- alias (commandline -opc)' -xa '(printf -- "%s\n" "true" "false")'
complete -c git -n '__fish_git_using_command town; contains -- config (commandline -opc)' -xa '(printf -- "%s\n" reset\t"Resets your Git Town configuration" \
                                                                                                                 setup\t"Prompts to setup your Git Town configuration")'
complete -c git -n '__fish_git_using_command town; contains -- hack (commandline -opc)' -s p -l prompt -d 'Prompt for the parent branch'
complete -c git -n '__fish_git_using_command town; contains -- kill (commandline -opc)' -xa '(__fish_git_branches)'
complete -c git -n '__fish_git_using_command town; contains -- main-branch (commandline -opc)' -xa '(__fish_git_branches)'
complete -c git -n '__fish_git_using_command town; contains -- new-branch-push-flag (commandline -opc)' -xa '(printf -- "%s\n" "true" "false")'
complete -c git -n '__fish_git_using_command town; contains -- new-branch-push-flag (commandline -opc)' -l global -d 'Displays or sets your global new branch push flag'
complete -c git -n '__fish_git_using_command town; contains -- offline (commandline -opc)' -xa '(printf -- "%s\n" "true" "false")'
complete -c git -n '__fish_git_using_command town; contains -- perennial-branches (commandline -opc)' -xa 'update' -d 'Prompts to update your perennial branches'
complete -c git -n '__fish_git_using_command town; contains -- prepend (commandline -opc)' -xa '(__fish_git_branches)'
complete -c git -n '__fish_git_using_command town; contains -- pull-branch-strategy (commandline -opc)' -xa '(printf -- "%s\n" "rebase" "merge")'
complete -c git -n '__fish_git_using_command town; contains -- rename-branch (commandline -opc)' -xa '(__fish_git_branches)'
complete -c git -n '__fish_git_using_command town; contains -- rename-branch (commandline -opc)' -l force -d 'Force rename of perennial branch'
complete -c git -n '__fish_git_using_command town; contains -- ship (commandline -opc)' -s m -l message -d 'Specify the commit message for the squash commit'
complete -c git -n '__fish_git_using_command town; contains -- sync (commandline -opc)' -l all -d 'Sync all local branches'
complete -c git -n '__fish_git_using_command town; contains -- sync (commandline -opc)' -l dry-run -d 'Output the commands that would be run without them'

# Define autocompletion of Git branch names.
#
# This is only enabled for commands that take branch names.
# This is achieved through __fish_complete_git_town_command_takes_branch
# complete --command git --arguments "(git branch | tr -d '* ')" --no-files
