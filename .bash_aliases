export LD_LIBRARY_PATH="/usr/local/cuda-10.0/lib64"
export PATH="/usr/local/cuda-10.0/bin":$PATH

function t() {
    tmux attach || tmux
}
