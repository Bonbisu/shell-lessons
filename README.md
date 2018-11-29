# Training Summary

## Internship Program - Part I

### Linux System Administration Fundamentals

#### Customize shell - Login Scripts

If we want to configure our linux or the shell itself, we can modify some configurations files. 

To configure our shell to run some script at linux login, we can modify `.bashrc`, to run every time the shell has opened, modify `.bash_profile`.
Also have a logoff scripts (normally to save logs or history) at `.bash_logout`. 

Here are some commands and their applications:

##### Variables

Like most progra
mming shell scripts also have variables, loops, functions, parameters, etc...

To create a variable locally we can simply assign this way:

```sh
FRUIT='apple'
echo $FRUIT # apple - shows what inside the variable
```

By convention, environment variable is written in _uppercase_.

- `export` 

    Makes the variable globally accessible.

    ```sh
    FRUIT='apple'
    export FRUIT 

    # another way

    export VEHICLE='car'
    ```


To display variables we can use in addition to "echo":

- `env`

    A separeted command that shows exported varaiables.
- `set`

    Built in command that shows local and global variables.

We can create a variable called `SSH_CONNECTION` to alter color prompt when connected as `SSH`, using functions exported in a variable.

##### Options

When we start to set our custom configs to our shell, some commands are good to know: 

- `allexport`

    Automatically exports every variable created

```sh
set -o allexport # auto export variables
set +o allexport # turns off
```



- `noclobber`

    In shell, we can write files with output of commands using `>` syntax, `noclobber` is kind of _secure mode_ to prevents overwrite files with this syntax. To ignore this restriction we can simply use `>|`. Noclobber also affects append `>>` syntax, not allowing to create files, just update them.

- ignoreeof

    We can use `ctrl + d` to exits from a opened shell, `ignoreeof` block this shortcut.

##### Aliases

Aliases reside in memory and are checked before PATH. We can set an alias for any command we want. For instance, in most linux distros, `ls` command is `alias ls='ls --color=auto'`.

- alias

    To create an alias we can use the syntax:

    ```sh
    alias <name>='<command>'
    ```
    
- unalias

    If wanted, we can "destroy" the alias for the rest of a section using:

    ```sh
    unalias ls
    ```
    This command can be inside a login script.

- \ 
    We can also 'unalias' temporarily with:

    ```sh
    \ls # will output ls w/o color=auto option
    ```
##### Functions

Functions are shell scripts thats reside in memory.

Change prompt color function example:

```sh
# PROMPT_RED and PROMPT_BLUE are variables that contains formatted shell prompt info like username, host, working directory...

PROMPT_RED="\[\033[1;31m\][\u@\h \w]$\[\033[0m\] "
PROMPT_BLUE="\[\033[1;34m\][\u@\h \w]$\[\033[0m\] "

function prompt <
    if [[ $1 = "red" ]]
        then
            export PS1=$PROMPT_RED
        else
            export PS1=$PROMPT_BLUE
    fi
>

# PS1 is a variable reserved to prompt format
# $1 is a first parameter.
```

##### Persistence

We can create scripts that runs everytime we need in order to make our changes to persists, also called login script.

- `.bash_profile`

    Runs once pe login - Apendint to PATH

- `.bashrc`

    Runs each time bash is lauched - Customize Prompt

If wanted to read a config file immediately we can use `source <config_file>` or `. <config_file>`.

```sh
source .bashrc

. .bashrc
```

#### Write Simple Shell Scripts

##### Create
In order to identify shell scripts, when give a name for then, we have to consider adding `.sh` as extension. 

##### Execute

To execute a script we need to give permission to run it. We can allow a script to run as executable file with:

```sh
chmod +x <script> # to revoke permition, use '-x' as option
```

Also, to run some script on any folder on bash, we must consider adding to `PATH` the directory where the script are such as `$HOME/bin/`. 

##### Debug

If we need to debug some script, the syntax used is:

```sh
bash -x <script>
```

Or, this option can be add in a `shebang` or `hash-pling`:

```sh
#!/bin/bash -x # <-- shebang

echo "Hello World" # <-- main code

exit 0 # <-- Exit code
```

##### Inputs

Shell have two ways to receive an input inside a script `read` and `parameters $`.

Ex:
```sh
#!/bin/bash

echo -e "Enter your name: \c" # '-e' allows use special characteres, '\c' supress the line feed (oposite as \n)

read INPUT_NAME

echo "Hello $INPUT_NAME"

exit 0
```

To create input by parameters:

```sh
#!/bin/bash

echo "Hello $1" # $1 takes the first parameter

exit 0
```

###### **Notes**: 
 - _To use more than ten parameters, we use number inside braces "{}", like `${14}`, of course more than 9 parameters is too much_.
- _`$0` refers to the script itself_.
- _`$*` represent all parameters except the script name_.
- _`$#` counts all parameters except the script name_.

##### Conditionals

- if

The structure of `if-then` statement in shel is:

```sh
#!/bin/bash
if (( $# < 1 )) # if have less than one param
    then # introduces the code block
        echo "Usage: $0 <name>" # echo correct usage
        exit 1 # exit with error
    else
        echo "Hello $1"
        exit 0
fi # close if statement (if spelled backwards)
```

- case

If we have many conditions to test, we can use `switch-case` statement:

```sh
#!/bin/bash

case $1 in # test $1 value
    "directory") # if equals to "directory"        
        find /etc -maxdepth 1 -type d # code block
        ;; # end of condition

    "link") # if equals to "link"
        find /etc - -maxdepth 1 -type l
        ;;

    *) # "else"
        echo "Usage: $0 directory | link"
        ;;
esac # close case statement (case spelled backwards) 
```

- Loops

Used to run some code over and over again. Shell have three types of loops: `for`, `until` and `while`.

- for:

```sh
#!/bin/bash

for u in $* # itererates each argument
do  # code block begin
    useradd $u  # creates an user using the param
    echo Password1 | passwd --stdin $u  # give a password
    passwd -e $u    # expire a password
done
```

###### **Notes**:

- Parentheses are used to test integer/numerical values.
- Square-brackets are used to test string values.

## Intersting commands

```sh
type <command> # show info a command

set -o # display options and states

echo $? # prints the exit

if [[ ! -d $1 ]] # test if $1 is not a directory

```
