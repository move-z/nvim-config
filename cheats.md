# File operations

- `:w[rite][!]` : write current buffer (! to force)
- `:wa[ll][!]`     : write all buffers (! to force)
- `:q[uit][!]`     : exit current window (! to force)
- `:qa[ll][!]`     : exit all windows (! to force)
- `:wq[!]`         : write current buffer and exit window (! to force)
- `:wqa[ll][!]`    : write all buffers and exit all windows (! to force)
- `:x[!]`          : alias to :wq but don't write if file is not modified
- `:xa[!]`         : alias to :wqa but don't write if file is not modified
- `ZZ`             : write current buffer and exit


# Movement

- `<n>h`     : left
- `<n>j`     : down
- `<n>k`     : up
- `<n>j`     : up

- `0`        : go to start of line
- `^`        : go to first non-whitespace character of line
- `$`        : go to end of line
- `<n>|`     : go to column n

- `<n>w`     : move forward n words
- `<n>W`     : move forward n words (space separated)
- `<n>e`     : move forward to end of next n words
- `<n>E`     : move forward to end of next n words (space separated)
- `<n>b`     : move backward n words
- `<n>B`     : move backward n words (space separated)
- `<n>(`     : move to beginning of current sentence
- `<n>)`     : move to beginning of next sentence
- `<n>{`     : move to beginning of current paragraph
- `<n>}`     : move to beginning of next paragraph
- `<n>[[`    : move to beginning of current section
- `<n>]]`    : move to beginning of next section

- `c-f`      : forward one screen
- `c-b`      : backward one screen
- `c-u`      : forward half screen
- `c-d`      : backward half screen

- `+`        : go to first non space character of next line
- `-`        : go to first non space character of previous line

- `<n>H`     : go to n lines from top of screen
- `M`        : go to middle of screen
- `<n>L`     : go to n lines to end of screen

- `c-e`      : scroll forward one line
- `c-y`      : scroll backward one line
- `z<ent>`   : scroll screen so that current line is at top
- `z.`       : scroll screen so that current line is at center
- `z-`       : scroll screen so that current line is at bottom

- `c-g`      : show current line number
- `<n>G`     : go to line n or end of file
- `<n>gg`    : go to line n or start of file
- ` `` `     : go to previous position
- `''`       : go to start of line of previous position

- `m<l>`     : set mark l (case sensitive letter)
- `` `<l> `` : go to mark l
- `'<l>`     : go to mark l (start of line)


# Edit

- `i`    : enter insert mode
- `I`    : enter insert mode at start of line
- `a`    : enter insert mode right of cursor
- `A`    : enter insert mode at end of line
- `<n>o` : create new blank line after current line and enter insert mode,
           repeating line n times (not universal)
- `<n>O` : create new blank line before current line and enter insert mode,
           repeating line n times (not universal)
- `c<m>` : enter insert mode changing text up to m
- `cc`   : enter insert mode replacing current line
- `C`    : enter insert mode replacing from cursor to end of line
- `r`    : replace current character
- `R`    : enter overwrite mode
- `<n>s` : enter insert mode replacing n chars
- `S`    : enter insert mode replacing current line

- `.`    : repeat last insert command
- `u`    : undo last edit
- `U`    : undo all edits on current line since cursor moved to that line
- `c-r`  : redo


# Buffer

- `<n>y<m>`  : copy from cursor to m
- `<n>yy`    : copy n lined
- `<n>d<m>`  : cut from cursor to m
- `<n>dd`    : cut n lines
- `D`        : cut from cursor to end of line
- `x`        : cut single character
- `X`        : cut single character before the cursor
- `<n>p`     : paste after cursor
- `<n>P`     : paste before cursor
- `"<l><c>`  : run command c on buffer l (default 0); if l is a capital letter, 
               append to buffer instead of overwriting


# Search / replace

- `/<pattern>`        : search pattern (or last pattern if empty)
- `?<pattern>`        : search pattern backward (or last pattern if empty)
- `n`                 : repeat search
- `N`                 : repeat search in reverse direction

- `<n>f<character>`   : move to next nth instance of character in line
- `<n>F<character>`   : move to previous nth instance of character in line
- `<n>f<character>`   : move to the character before the next nth instance of 
                        character in line
- `<n>F<character>`   : move to the character after the previous nth instance of 
                        character in line
- `;`                 : repeat previous find
- `,`                 : repeat previous find in opposite direction

- `:set nowrapscan`   : don't wrap search

- `:<c>s/<p>/<r>/<f>` : replace pattern p with r at coordinates c, optionally 
                        with flags f
												for coordinates see section Coordinates
- `:<c>g/<pattern>`   : print all matching lines
- `:<c>g!/<pattern>`  : print all non matching lines



# Alter

- `<n>~`     : toggle case for n characters
- `<n>J`     : join together with next n lines

- `<m>m<n>`  : move lines m after line n
- `<m>t<n>`  : copy lines m after line n
- `<m>co<n>` : copy lines m after line n (same as t)


# Options

- `:se[t] w[rap]m[argin]=<n>` : wrap at column n
- `:se[t] nu[mber]` : show line numbers


# Coordinates

- `a,b`            : from a to b, e.g. '1,10', '.,$'
- `a;b`            : from a to b, but b is calculated relative to a
- `.`              : current line
- `0`              : start of file
- `$`              : last line
- `%`              : all lines
- `+<n>` or `-<n>` : relative to current line (default n == 1)
- `/<p>/`          : next line containing pattern p


