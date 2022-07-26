# cub_test3r 🕹 🧪

An automated tester for checking 42's cub3D project against a variety of valid and invalid inputs. I also have some strange tests...

## Installation - 🛠

Clone the test3r in any directory. I recommend putting the test3r in the root of cub3D.

```
git clone git@github.com:xvoorvaa/cub_test3r.git
```

## Usage - ⌨️

Create a `./cub3d` executable. If you have a different name as executable, you can change in my test3r the name of the executable it should look for. Check `./PRIVATE/script_functions.sh` and change line 26 (Default: `EXE=$1/cub3d`).

Then type in `./cub3d $PATH_TO_YOUR_CUB3D_DIR`. <br>
PATH_TO_YOUR_CUB3D_DIR obviously be the path to your cub3D directory.

Some tests are meant to launch the game. Simply exit the game to continue testing.

Note: the test3r assumes your program is able to handle .PNG texture files. Otherwise you will get an MLX error/segfault.

## Add your own tests - 💾

You can add your own tests by following these simple steps!

Go to `./start_test3r.sh` and choose what kind of test it should be. Is it a valid-, invalid- or visual test? <br>

If you made your choice, go to that "section" of my file by checking the comments.
Duplicate the last line of the "section" and change the second and third parameter. <br>
The second is the path of the map you would like to test. The third a string to clarify what kind of test it is. You can make a variable of the message by going to `PRIVATE/test_messages.sh` and adding the message.

<br>
<i>-- Have fun testing! --</i>
