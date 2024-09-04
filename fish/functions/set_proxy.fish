function set_proxy
    set -l proxy_url $argv[1]

    if test -z "$proxy_url"
        echo "Usage: set_proxy <proxy_url>"
        return 1
    end
    set -xg all_proxy $proxy_url
    echo "Proxy set to $proxy_url"
end

