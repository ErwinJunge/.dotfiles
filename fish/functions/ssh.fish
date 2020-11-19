function ssh-add-keys-unconditional
    mkdir -p /tmp/sshpubkeys
    for name in (pass ls ssh | tail -n+2 | grep -E -o '([A-Za-z0-9]|-|_|\.)+')
        pass show "ssh/$name" | ssh-add -q -k -
    end
    for keyspec in (ssh-add -L)
        echo "$keyspec" > /tmp/sshpubkeys/(echo $keyspec | cut -d ' ' -f3)
    end
end
function ssh-add-keys
    if not ssh-add -L > /dev/null
        ssh-add-keys-unconditional
    end
end

function ssh
    ssh-add-keys
    /usr/bin/ssh $argv
end
