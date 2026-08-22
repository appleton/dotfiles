if type -q pgrep
    if pgrep -x Proxyman >/dev/null 2>&1
        set -gx GODEBUG x509ignoreCN=0,http2server=0
        set -gx GOFLAGS -insecure
        set -gx GOPROXY http://127.0.0.1:9090,direct
        set -gx HTTPS_PROXY http://127.0.0.1:9090
        set -gx HTTP_PROXY http://127.0.0.1:9090
        set -gx NO_PROXY 'localhost,127.0.0.1,::1,*.local,*.localhost'
        set -gx https_proxy $HTTPS_PROXY
        set -gx http_proxy $HTTP_PROXY
        set -gx no_proxy $NO_PROXY
    end
end
