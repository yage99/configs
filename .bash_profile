export PATH=/usr/local/opt/qt/bin:/opt/local/bin:/usr/local/bin:/usr/local/sbin:/Users/zhangya/Library/Android/sdk/tools:/Users/zhangya/Library/Android/sdk/platform-tools:/Applications/apache-maven-3.3.3/bin:/Library/TeX/texbin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home/
ulimit -S -n 1024

if [ -d "/Volumes/MarshMallow/bin" ] ; then
	PATH="/Volumes/MarshMallow/bin:$PATH"
fi
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

PATH="/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/mysql-5.7.19-macos10.12-x86_64/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
alias gitll="git log --graph"
alias ls="ls -G"

export EDITOR=vim
export TEXINPUTS="~/Projects/latex-templates:"
export MATLAB_JAVA=${JAVA_HOME}jre
