Ruby script to make an MP3 file from input text.

Using Ruby b/c I use it for other tools.

Works on Mac only, as it uses `say` and `lame`.

Prereqs: `brew install lame`

## Example

`ruby main.rb -v Daniel -o hello.mp3 'Here is a sentence!'`

## Export as a function

Then to install this as a "native-like" function, add the following to your .bash_profile:

```
function text2mp3 () {
    ruby /Users/jeff/Documents/Projects/mactext2mp3/main.rb "$@"
}
```

