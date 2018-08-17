LIB_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

hello_fn() {
    echo "hello from hello_fn $(pwd) - LIB_SCRIPT_DIR $LIB_SCRIPT_DIR"
}
