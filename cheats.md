# File operations

Command | Description
---|---
`:w[rite][!]` | write current buffer (`!` to force)
`:w[rite][!] <filename>` | write current buffer to specific file<br>% in filename is replaced with current file name
`:w[rite][!] >><filename>` | append current buffer to specific file
`:<c>w[rite][!] <filename>` | write only part of the file (see [Coordinates](#Coordinates) for valid values for c)
`:wa[ll][!]` | write all buffers (`!` to force)
`:q[uit][!]` | exit current window (`!` to force)
`:qa[ll][!]` | exit all windows (`!` to force)
`:wq[!]` | write current buffer and exit window (`!` to force)
`:wqa[ll][!]` | write all buffers and exit all windows (`!` to force)
`:x[!]` | alias to `:wq` but don't write if file is not modified
`:xa[!]` | alias to `:wqa` but don't write if file is not modified
`ZZ` | write current buffer and exit
`:e <filename>` | open file (may be new), open buffer if already open
`:e #` | reopen last file
`c-^` | same as `:e #`
`:e!` | reopen current file (discard changes)
`:<n>r <filename>` | insert content of file at line n or next line, 0 for start of file, $ for end of file, /pattern/ after line containing pattern
|
`:n[ext]` | go to next file
`:args` | show list of open files



# Movement

Command | Description
---|---
`<n>h` | left
`<n>j` | down
`<n>k` | up
`<n>l` | right
|
`0` | go to start of line
`^` | go to first non-whitespace character of line
`$` | go to end of line
`<n>\|` | go to column n
|
`<n>w` | move forward n words
`<n>W` | move forward n words (space separated)
`<n>e` | move forward to end of next n words
`<n>E` | move forward to end of next n words (space separated)
`<n>b` | move backward n words
`<n>B` | move backward n words (space separated)
`<n>(` | move to beginning of current sentence
`<n>)` | move to beginning of next sentence
`<n>{` | move to beginning of current paragraph
`<n>}` | move to beginning of next paragraph
`<n>[[` | move to beginning of current section
`<n>]]` | move to beginning of next section
|
`c-f` | forward one screen
`c-b` | backward one screen
`c-d` | forward half screen
`c-u` | backward half screen
|
`<n>+` | go to first non space character of next n line
`<n>-` | go to first non space character of previous n line
|
`<n>H` | go to n lines from top of screen
`M` | go to middle of screen
`<n>L` | go to n lines to end of screen
|
`c-e` | scroll forward one line
`c-y` | scroll backward one line
`z<ent>` | scroll screen so that current line is at top
`z.` | scroll screen so that current line is at center
`z-` | scroll screen so that current line is at bottom
|
`c-g` | show current line number
`<n>G` | go to line n or end of file
`<n>gg` | go to line n or start of file
` `` ` | go to previous position
`''` | go to start of line of previous position
|
`m<l>` | set mark l (case sensitive letter)
`` `<l> `` | go to mark l
`'<l>` | go to mark l (start of line)


# Edit

Command | Description
---|---
`i` | enter insert mode
`I` | enter insert mode at start of line
`a` | enter insert mode right of cursor
`A` | enter insert mode at end of line
`<n>o` | create new blank line after current line and enter insert mode, repeating line n times (not universal)
`<n>O` | create new blank line before current line and enter insert mode,repeating line n times (not universal)
`c<m>` | enter insert mode changing text up to m
`cc` | enter insert mode replacing current line
`C` | enter insert mode replacing from cursor to end of line
`r` | replace current character
`R` | enter overwrite mode
`<n>s` | enter insert mode replacing n chars
`S` | enter insert mode replacing current line
|
`.` | repeat last insert command
`u` | undo last edit
`U` | undo all edits on current line since cursor moved to that line
`c-r` | redo
|
`<n>~` | toggle case for n characters
`<n>J` | join together with next n lines
|
`<c>d` | delete lines at [coordinates](#Coordinates) c
`<c>m<n>` | move lines at [coordinates](#Coordinates) c after line n
`<c>t<n>` | copy lines at [coordinates](#Coordinates) c after line n
`<c>co<n>` | copy lines at [coordinates](#Coordinates) c after line n (same as t)
|
`:se[t] w[rap]m[argin]=<n>` | wrap at column n
`:se[t] nu[mber]` | show line numbers


# Buffer

Command | Description
---|---
`<n>y<m>` | copy from cursor to m
`<n>yy` | copy n lined
`<n>d<m>` | cut from cursor to m
`<n>dd` | cut n lines
`D` | cut from cursor to end of line
`x` | cut single character
`X` | cut single character before the cursor
`<n>p` | paste after cursor
`<n>P` | paste before cursor
`"<l><cmd>` | run command cmd (y, d, p) on buffer l (default 0); if l is a capital letter, append to buffer instead of overwriting
`:<c>ya <l>` | yank to buffer l, with [Coordinates](#Coordinates) c
`:<c>pu <l>` | put from buffer l, with [Coordinates](#Coordinates) c


# Search / replace

Command | Description
---|---
`/<pattern>` | search pattern (or last pattern if empty)
`?<pattern>` | search pattern backward (or last pattern if empty)
`n` | repeat search
`N` | repeat search in reverse direction
|
`<n>f<character>` | move to next nth instance of character in line
`<n>F<character>` | move to previous nth instance of character in line
`<n>f<character>` | move to the character before the next nth instance of character in line
`<n>F<character>` | move to the character after the previous nth instance of character in line
`;` | repeat previous find
`,` | repeat previous find in opposite direction
|
`:se[t] ignorecase` | ignore case
`:se[t] nowrapscan` | don't wrap search
`:se[t] nomagic` | ignore special characters in pattern
|
`:<c>s/<p>/<r>/<f>` | replace first occurrence of pattern p with r at coordinates c, optionally with flags f<br>most characters can be used instead of /<br> for coordinates see section [Coordinates](#Coordinates)<br>flags:<br>`g`: replace all matches, not only the first one<br>`i`: case insensitive match<br>`c`: ask confirmation
`:<c>g/<l>/s/<p>/<r>/<f>` | like s but on lines that contain pattern l<br>pattern p can be omitted if equal to l
`:s` | repeat last replace
`&` | same as `:s`
`:~` | repeat last replace but with patter from last command of any kind with a pattern
|
`:<c>g/<pattern>` | print all matching lines
`:<c>g!/<pattern>` | print all non matching lines


# Coordinates

Command | Description
---|---
`a,b` | from a to b, e.g. `1,10`, `.,$`
`a;b` | from a to b, but b is calculated relative to a
`.` | current line
`0` | start of file
`$` | last line
`%` | all lines
`+<n>` or `-<n>` | relative to current line (default n == 1)
`/<p>/` | next line containing pattern p
`g/<p>/` | all lines containing pattern p


# Regex syntax

Command | Description
---|---
`.` | any character
`*` | 0 or more of previous element
`^` | start of line if at start of regex
`$` | end of line if at end of regex
`[]` | character set, supports intervals
`\(\)` | groupings, replacement is \<n>, can be used in pattern
`\<\>` | beginning and end of word
`[:alnum:]` | alphanumeric characters
`[:alpha:]` | alphabetic characters
`[:lower:]` | lowercase characters
`[:upper:]` | uppercase characters
`[:digit:]` | numeric characters
`[:xdigit:]` | hexadecimal digits
`[:punct:]` | punctuation characters
`[:graph:]` | printable and visible (nonspace) characters
`[:space:]` | whitespace characters
`[:blank:]` | space and tab characters
`[:print:]` | printable characters (includes whitespace)
`[:cntrl:]` | control characters
`[.<seq>.]` | treat sequence as unit
`\n` | nth grouping
`&` | all matching text
`~` | repeat last substitute pattern
`\l` or `\u` | convert to lowercase or uppercase next element
`\L` or `\U` with `\e` or `\E` | convert to lowercase or uppercase until `\e` or `\E` or end of line



