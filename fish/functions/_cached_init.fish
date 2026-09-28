function _cached_init --description 'Print the path to a cached copy of a tool\'s shell init script'
    # Usage: source (_cached_init zoxide init fish --cmd j)
    # The cache is regenerated whenever the resolved binary path, its mtime or
    # the arguments change, so upgrades are picked up automatically.
    set -l bin (command -s $argv[1]); or return
    set -l real (path resolve $bin)
    set -l key "# $real "(path mtime $real)" $argv[2..]"
    set -l cache $__fish_cache_dir/init/$argv[1].fish

    set -l cached_key
    test -f $cache; and read cached_key <$cache
    if test "$cached_key" != "$key"
        mkdir -p (path dirname $cache)
        begin
            echo $key
            $bin $argv[2..]
        end >$cache.tmp; and mv -f $cache.tmp $cache
    end

    echo $cache
end
