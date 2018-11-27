function qgrep() {
        echo "----------"
        grep -IRn --exclude-dir="*\.git*" --include=\*.{java,cpp,c,cc,h,hpp,xml,py}  "$*"
}
