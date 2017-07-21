if [ -d "youpi" ]; then
    echo "   * Pulling YOUPI Git"
    cd youpi
    git pull
else
    echo "   * Clonning YOUPI Git"
    git clone git@github.com:dynamid/youpi.git
fi
