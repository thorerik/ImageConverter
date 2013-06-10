## This function is from http://www.snabelb.net/content/bash_support_function_check_dependencies
function deps {
        DEPENDENCIES="mogrify exiftool"
 
        deps_ok=YES
        for dep in $DEPENDENCIES
        do
                if ! which $dep &>/dev/null;  then
                        echo -e "This script requires $dep to run but it is not installed"
                        deps_ok=NO
                fi
        done
        if [[ "$deps_ok" == "NO" ]]; then
                echo -e "Unmet dependencies ^"
                echo -e "Aborting!"
                exit 1
        else
                return 0
        fi
}

