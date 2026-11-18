# Lab 03

## GenAI used

I used Chatgpt for this lab. Mostly for assisted editing, like checking errors and fixing mistakes in my scripts. 
I wrote the scripts using the lab and the bash command links provided, AI helped me find what was wrong and make them cleaner.
## Prompts i used

Gemini:
- "why is this bash script not working"
- "whats wrong with this if statement"
- "how do i add date and time to a log file in bash"
- why git clone said "Command 'clone' not found"
chatgpt
- why mv kept saying "No such file or directory"
- difference between mv and touch


## What i changed after AI

- I was typing `$git clone`. The $ is just the prompt in the guide, you're not meant to type it. Took it out and it worked.
- I used `~lab03/` for the path which was wrong, it should just be `lab03/`. Also the file downloaded as a .txt so I renamed it to .sh.
- In exercise 2 I had `logfile ="ouput.txt"` with a space before the =. Bash doesn't allow that so I changed it to `logfile="output.txt"`.
- My timestamp line was missing a closing quote, fixed it to `timestamp=$(date "+%Y-%m-%d %H:%M:%S")`.
- I forgot to put `$timestamp` in my echo lines so the log had no date. Added it in.

## Reflection

I only used AI when something wasn't working, and I asked why it was wrong so I'd actually get it instead of just copying a fix. 
I tested each script after changing it to make sure it worked.
I get $1 and $2, -gt, >> for adding to a file, and the difference between mv, cp and touch a lot better now.
