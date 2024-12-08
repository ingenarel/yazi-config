- i'm using the yazi-git from aur and my own fork of omp.yazi plugin as a submodule.

- clone the bad boy.
- cd into it
- `git submodule init`
- `git submodule update`
- if you're using windows, theres a [bug](https://github.com/git-for-windows/git/issues/1613) with git in windows where git doesn't ask for your ssh key's password when using submodules. and if you have an ssh key with a password, the submodule update doesn't work. use [this workaround](https://github.com/git-for-windows/git/issues/1613#issuecomment-962240162) for it. if it still doesn't work, just go to the plugins directory. delete it. then clone [my fork of omp.yazi here](github.com/ingenarel/omp.yazi)
