# docker-python
A base Docker project that can be the base for python development.

## Getting Started
This is a quick start guide to create a new repo based upon the docker-python base.
1. Create a new repo using `UCDClassNitta/docker-python` as the template. 
1. Clone the repo locally using `git clone PATH_TO_YOUR_REPO` where `PATH_TO_YOUR_REPO` is your repo path.
1. Add any necessary Python packages to the `requirements.txt` file.
1. Build the docker image using command such as `docker build -t python-img .` assuming you want to name the image `python-img`.
1. Create a docker container name `python-con` based upon the `python-img` docker image and mount it to the current directory.
  * System with bash (Linux or OS-X) execute `docker run -it -v $(pwd):/workspace --name python-con python-img`
  * Windows Command Prompt execute `docker run -it -v "%cd%:/workspace" --name python-con python-img`

## Setting up git within Docker
This section will allow you to create an ssh key and to configure git within the docker container. This is helpful in case you want to work with git inside the container, though may not be necessary if you are using git on the host machine. You should only need to complete this once for the container.
1. Run the `configure-git.sh` script by executing `./configure-git.sh` at the command prompt. You should be prompted for your name and e-mail like see something like: 
    ```
    root@1234:/workspace# ./configure-git.sh 
    Enter your name : YOUR NAME HERE
    Enter your email: your_email@your.domain
    Generating public/private ed25519 key pair.
    ```
1. When prompted for location to save the key, just hit enter.
    ```
    Enter file in which to save the key (/root/.ssh/id_ed25519): 
    ```
1. When prompted for a passphrase enter one that you will be able to remember. This will protect you in case somone were to get the key file from the container.
    ```
    Created directory '/root/.ssh'.
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    ```
1. Once that is complete you should see something like:
    ```
    Your identification has been saved in /root/.ssh/id_ed25519
    Your public key has been saved in /root/.ssh/id_ed25519.pub
    The key fingerprint is:
    SHA256:4Ir8tftTY/b5L5iqwR2jeV2J4VoXQNEGCZ6zDlcqTEU your_email@your.domain
    The key's randomart image is:
    +--[ED25519 256]--+
    |      o +o o     |
    |. o..+ ..  o++ . |
    |     +.oo + o    |
    |     .o S o .    |
    |       +o*E      |
    | +.o. +  + o+.   |
    |    ..+o o +     |
    |. ..oo . .=  .   |
    | . .o+=...  ++o  |
    +----[SHA256]-----+
    Git and SSH configuration complete.
    Run load-ssh-key.sh to load the generated key.
    ```
1. Load the ssh key using `load-ssh-key.sh` by executing `./load-ssh-key.sh` at the command prompt. You will be prompted for the passphrase.
    ```
    root@1234:/workspace# ./load-ssh-key.sh 
    Agent pid 33
    Enter passphrase for /root/.ssh/id_ed25519: 
    Identity added: /root/.ssh/id_ed25519 (your_email@your.domain)
    ```
1. Add the ssh key into github by following directions at [Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) 

## Restarting Docker Container
After you exit the docker container, you may want to restart it. Especially if you generated ssh keys inside the container and plan on using git within the docker container. To restart and reenter the container you will run the following commands:
1. Restart the with the command `docker restart python-con` assuming you named your container `python-con`. You should see something like:
    ```
    % docker restart python-con 
    python-con
    ```
1. Execute bash on the container with the command `docker exec -it python-con bash` (again assuming you named your container `python-con`). You should see something like:
    ```
    % docker exec -it python-con bash
    root@1234:/workspace# 
    ```
1. Load the ssh key using `load-ssh-key.sh` by executing `./load-ssh-key.sh` at the command prompt. You will be prompted for the passphrase.
    ```
    root@1234:/workspace# ./load-ssh-key.sh 
    Agent pid 33
    Enter passphrase for /root/.ssh/id_ed25519: 
    Identity added: /root/.ssh/id_ed25519 (your_email@your.domain)
    ```