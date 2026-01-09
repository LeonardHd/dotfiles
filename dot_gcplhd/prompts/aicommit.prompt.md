---
name: aicommit
description: Collect code changes and create a meaningful git commit.
argument-hint: Summarize the code changes made in the working directory
---
Collect the code changes in the working directory and craft a meaningful commit message.

## Steps:
1. Run `git status` to see all modified, added, deleted, and renamed files
2. Run `git diff` to examine the actual code changes in tracked files
3. Run `git diff --cached` if there are staged changes to review
4. Analyze the changes to understand:
   - What was added, modified, or removed
   - The purpose and intent behind the changes
   - Any patterns or themes across multiple file changes
5. Craft a clear, concise commit message following conventional commit format
6. Stage all changes with `git add -A`
7. Commit with the crafted message

## Commit Message Guidelines:
- Use imperative mood ("Add feature" not "Added feature")
- First line: brief summary (50 chars or less ideal)
- Optional body: explain what and why, not how
- Reference related issues if applicable

## Output:
- A summary for the human explaining what changes were made and why
- Execute the git commit with the crafted message
