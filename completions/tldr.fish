# This is slower, to echo everything one by one.
#
# function __fish_tldr_complete_available_pages
#     for f in ~/.local/share/tldr/pages/**/*.md
#         echo (string replace -r '.*/([^/]*)\.md' '$1' $f)
#     end
# end
#complete -x -c tldr -a '(__fish_tldr_complete_available_pages)'

# it is faster to find everything and use a single sed command to replace it to the correct format.
complete -x -c tldr -a '(printf "%s\n" ~/.local/share/tldr/pages/**/*.md | sed -r "s:^.*/([^/]*)/([^/]*)\.md:\2\t\1:")'