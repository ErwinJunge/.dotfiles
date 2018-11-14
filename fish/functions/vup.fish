function vup
    if test -n "$VIRTUAL_ENV"
        set current_env $VIRTUAL_ENV
    end
    for virtualenv_name in (lsvirtualenv)
        echo $virtualenv_name
        workon $virtualenv_name
        if python --version | grep -q 'Python 3'
            vmk3post
        else if python --version | grep -q 'Python 2'
            vmk2post
        else
            echo 'unknown python version'
        end
    end
    if set -q current_env
        workon (basename $current_env)
    else
        deactivate
    end
end
