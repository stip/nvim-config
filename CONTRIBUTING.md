# Contributing to nvim-config

Thank you for your interest in contributing to this project! This document provides guidelines to help maintain a clean and useful commit history.

## What Characterizes a Good Commit

A good commit is essential for maintaining a readable and useful project history. Here are the key characteristics:

### 1. Atomic Changes
- Each commit should represent a single logical change
- If you're fixing multiple bugs or adding multiple features, split them into separate commits
- A commit should be the smallest unit of change that makes sense on its own

### 2. Clear and Descriptive Commit Messages

A good commit message has two parts:

#### Subject Line (First Line)
- Keep it under 50 characters when possible
- Use the imperative mood ("Add feature" not "Added feature" or "Adds feature")
- Capitalize the first letter
- Don't end with a period
- Be specific and descriptive

**Good examples:**
```
Add telescope fuzzy finder configuration
Fix buffer navigation keybindings
Update LSP server configuration for Python
Remove deprecated plugin references
```

**Bad examples:**
```
fix bug
updates
WIP
changed some stuff
```

#### Body (Optional but Recommended)
- Leave a blank line after the subject
- Wrap lines at 72 characters
- Explain *what* and *why*, not *how*
- Reference related issues or pull requests

**Example of a complete commit message:**
```
Add support for Go language server

Configure gopls as the language server for Go development.
This includes auto-formatting on save and integration with
the existing LSP keybindings.

Fixes #42
```

### 3. Functional and Complete
- The code should work after the commit (don't break the build)
- All tests should pass
- The commit should not introduce known bugs
- Include related documentation updates in the same commit

### 4. Focused Scope
- Don't mix refactoring with functional changes
- Don't mix whitespace changes with code changes
- Keep formatting changes separate from logic changes

### 5. Useful History
Good commits help when:
- Using `git log` to understand project evolution
- Using `git bisect` to find bugs
- Using `git blame` to understand why code exists
- Reviewing changes in pull requests
- Reverting specific changes if needed

## Examples

### Good Commit Series
```
1. Add nvim-treesitter plugin
2. Configure treesitter for syntax highlighting
3. Add treesitter text objects for navigation
```

### Bad Commit Series
```
1. Initial commit
2. Updates
3. Fix
4. More fixes
5. Final version
```

## Additional Guidelines

### When to Commit
- After completing a logical unit of work
- Before switching to work on something else
- When all tests pass
- When the code is in a working state

### What Not to Commit
- Temporary or debug code
- Commented-out code blocks (unless there's a good reason documented)
- Local configuration files specific to your setup
- Generated files or build artifacts
- Secrets or credentials

## Resources

For more information on writing good commit messages, see:
- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/) by Chris Beams
- [Conventional Commits](https://www.conventionalcommits.org/) specification
- [Git Documentation](https://git-scm.com/doc)

## Questions?

If you have questions about these guidelines or need help with your contribution, feel free to open an issue for discussion.
