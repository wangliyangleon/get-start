# START ROCKING
## Make my C++ (not only) development environment cooler (from scratch)

### Step 1:

* Install *Command Line Developer Tools* with: **xcode-select --install**
* Install *Oh-my-zsh* with: **sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"**

### Step 2:
Install some nice softwares:

* [iterm2](https://www.iterm2.com/)
* [Chrome](https://www.google.com/chrome/)

### Step 3:
Setup GIT and SSH key by the following commands:

* git config --global user.name "yourname"
* git config --global user.email "youremail@gmail.com"
* ssh-keygen -t rsa -C "youremail@gmail.com"
* cat ~/.ssh/id_rsa.pub

### Step 4:
Let's just run **setup.sh**

### Step 5:
Install *GCC* with: **brew install gcc --with-all-languages --without-multilib**
