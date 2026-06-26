function get_proxy
    if set -q all_proxy
        echo "all_proxy=$all_proxy"
    end

    if set -q http_proxy
        echo "http_proxy=$http_proxy"
    end

    if set -q https_proxy
        echo "https_proxy=$https_proxy"
    end

    if not set -q all_proxy; and not set -q http_proxy; and not set -q https_proxy
        echo "Proxy is not set"
        return 1
    end
end
