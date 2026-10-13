# Minimal `README.md`

```markdown
# waseems-navi

My personal cheatsheets for [navi](https://github.com/denisidoro/navi).

---

## What is navi?

[navi](https://github.com/denisidoro/navi) is an interactive cheatsheet tool
for the command-line. Instead of memorizing flags or digging through `man`
pages, you browse a searchable list of commands and run the one you want —
filling in placeholders as you go.

It's powered by [`fzf`](https://github.com/junegunn/fzf), so the picker feels
like fuzzy-searching your shell history.

**Who is it for?**
- Anyone who Googles the same `tar`/`ffmpeg`/`docker` flags over and over.
- People who want a personal, version-controlled library of commands.
- Anyone who prefers "search and run" over "remember and type."

---

## This repo

A collection of my own `.cheat` files, used with navi.

Original project: <https://github.com/denisidoro/navi>

---

## Example

```cheat
% git, branch

# Create and switch to a new branch
git checkout -b <branch>

# List branches sorted by last commit
git branch --sort=-committerdate
```

Run `navi`, type a keyword, pick a command, done.
```

---

That's it — short, says what navi is, who it's for, points to the upstream repo, and shows one example so the format is obvious.

Want a one-line version instead (just a title + link + tagline)?
