if status is-interactive
    # Commands to run in interactive sessions can go here

    abbr -a rm trash
    abbr -a vim nvim
    abbr -a lg lazygit
    abbr -a st speedtest

    # laravel
    abbr -a art "php artisan"
    abbr -a pint "./vendor/bin/pint"
    abbr -a pintd "./vendor/bin/pint --dirty"
    abbr -a pest "./vendor/bin/pest"
    abbr -a pestl "./vendor/bin/pest --parallel"
    abbr -a test "php artisan test"
    abbr -a testl "php artisan test --parallel"
    abbr -a migrate "php artisan migrate"
    abbr -a fresh "php artisan migrate:fresh --seed"
    abbr -a listen "php artisan queue:listen"
    abbr -a work "php artisan queue:work"
    abbr -a stan "./vendor/bin/phpstan"
    abbr -a tinker "php artisan tinker"
    abbr -a stinker "./vendor/bin/sail artisan tinker"
    abbr -a sail "./vendor/bin/sail"
    abbr -a samfs "./vendor/bin/sail artisan migrate:fresh --seed"
    abbr -a vite "./vendor/bin/sail npm run dev"
    abbr -a pa "./vendor/bin/sail artisan"
end

set fish_greeting ""

# mise-en-place
mise activate fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# composer
set --export PATH /Users/seanm/.composer/vendor/bin $PATH

# mariadb
set --export PATH /Users/Shared/DBngin/mariadb/10.11.6_arm/bin $PATH

# postgres
set --export PATH /Users/Shared/DBngin/postgresql/17.0/bin $PATH

# redis
set --export PATH /Users/Shared/DBngin/redis/7.0.0/bin $PATH

# Laravel Herd PHP configurations
set -Ux HERD_PHP_83_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/83/"
set -Ux HERD_PHP_84_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/84/"

# Yazi file manager config
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Set up fzf key bindings
fzf --fish | source

# set neovim as the default editor
set -gx EDITOR nvim
