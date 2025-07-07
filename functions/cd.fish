if status is-interactive
    function cd --wraps=z
        z $argv || return $status
        if test -d .git; and git rev-parse --is-inside-work-tree &>/dev/null
            onefetch || true
        end
    end
end