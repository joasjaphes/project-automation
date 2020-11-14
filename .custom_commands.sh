#! usr/bin/sh
function create () {
    # to do add logic for cloning remote repo...............
    # git@github.com:Jcom2019/meals_app.git
    read -p 'Username:' username
    read -sp 'Password:' password
    echo
    echo $password 'login to your account...'
    DIR=`pwd`
    echo $DIR
    cd
    python3 project-automation/create.py $1 $username $password
    cd $DIR
    mkdir $1
    cd $1
    git init
    git remote add origin git@github.com:$2/$1.git
    touch Readme.md
    git add .
    git commit -m 'initial commit'
    git push origin master
    code .
    echo $1
}