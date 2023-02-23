# shipsoftheseus

Code for Ships of Theseus

Shakespeare sonnet project

Replacing Shakespeare's sonnets one line at a time.

Herein is an archive of files used in creation of the author's project "Ships of Theseus", in which Shakespeare's sonnets were recreated one line at a time.

Some context for the name of this project may be found at https://en.wikipedia.org/wiki/Ship_of_Theseus

Usage (current):

To display the historical state after X lines had been replaced:

If you run ruby print_on_demand.rb from this directory it will prompt you for a range (first sonnet to last) with defaults 1 and 154

Then it will ask for the number of lines to replace (0 = all Shakespare 2156 = all mine)

A line starting with ** indicates that a line was replaced at this point

----------------

The ambitious reader is also invited to try their own hand at playing Shakespeare with the diy files included here.  This is a work in progress and structure and functionality is subject to change.

Usage (current):

A json file seeded with the same random seed as used by the author is included as diy_randorder.json

This determines the order in which lines in the sonnet will be swapped.

To generate your own user-specific random seed:
ruby diy_make_rand_file.rb

...or you can simply leave the original and rewrite the sonnets in the same order as the author.

To begin writing your own sonnets:
ruby diy_swapsonnets.rb

An introductory message will appear and you will be prompted to press enter to continue.

A randomly-selected sonnet will then appear with one of the lines blank.  You will be instructed to provide the missing line with a line of your choosing.

Entering Ctrl-C (in many terminals) or simply entering a blank line will exit without changing the line.

Changes are tracked in the data file diy_sonnetshake_mod.json .  This file can be manually edited in the obvious manner in case of mistakes.  There is currently no automated utility for doing this.

Finally, when you have finished rewriting all of Shakespeare's sonnets:
ruby diy_print_on_demand.rb
should behave in a manner similar to above for viewing your progress at any point.

Please note that Shakespeare included a few "irregular" sonnets which have unusual rhyme schemes, empty lines, too many lines, etc.  This program does not deal with those special cases, so there may be a few bugs associated.  In particular:

Sonnet 99 (index 98) has fifteen lines instead of the usual fourteen
Sonnet 126 (index 125) has six couplets and two blank lines at the end
Sonnet 145 (index 144) is in iambic tetrameter rather than pentameter (i.e. shorter lines/syllable count)


