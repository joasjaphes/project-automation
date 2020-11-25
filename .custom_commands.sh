#! usr/bin/sh

# command to initialize projects, 
# it create local repo as well as remote repo and push initial commit,
# it also create readme.md file
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
    git remote add origin git@github.com:$username/$1.git
    touch Readme.md
    git add .
    git commit -m 'initial commit'
    git push origin master
    code .
    echo $1
}
#command to change remote url for your local repositories having common remote,
function changeRemote () {
    cd
    cd joas/projects
    for dir in */
    do
        # echo $dir
        cd $dir
        result=`pwd`
        remote=`git remote -v`
        if echo "$remote" | grep -q "Jcom2019"; then
            dirname=`basename $result`
            echo $dirname
            git remote set-url origin git@github.com:joasjaphes/$dirname.git
            echo "$remote"
        fi
        # echo $dirname
        cd ../
    done
}