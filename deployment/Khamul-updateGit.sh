if [ ! -d "youpi" ]; then
    echo "   * Clonning YOUPI Git"
    git clone git@github.com:dynamid/youpi.git
else
    echo "   * Pulling YOUPI Git"
    cd youpi
    git pull
fi
