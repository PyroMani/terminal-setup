echo "Installing terminal-scripts"
PWD=$(PWD)

echo "Create backup of old scripts"
[[ ! -d ./backup      ]] && mkdir $PWD/backup
[[ -f ~/.bash_profile ]] && mv ~/.bash_profile $PWD/backup/
[[ -f ~/.bashrc       ]] && mv ~/.bashrc $PWD/backup/
[[ -f ~/.gitconfig    ]] && mv ~/.gitconfig $PWD/backup/
[[ -f ~/.vimrc        ]] && mv ~/.vimrc $PWD/backup/

echo "Copy new scripts" 
cp $PWD/.* ~/

