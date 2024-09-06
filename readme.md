- i'm using the yazi-git from aur and my own fork of omp.yazi plugin as a submodule.

- clone the bad boy.
- cd into it
- `git submodule init`
- `git submodule update`
- if you're using windows, i've found a bug with git in windows where git doesn't ask for your ssh key's password. and if you have an ssh key with a password, the submodule update doesn't work. in that case, just go to the plugins directory. delete it. then clone [my fork of omp.yazi here](github.com/ingenarel/omp.yazi)
- windows users also need to change the omp.yazi branch to the windows branch using `git switch windows`
