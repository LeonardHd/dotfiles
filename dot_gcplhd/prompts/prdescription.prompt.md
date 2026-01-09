---
name: prdescription
description: Generate a detailed pull request description based on code changes.
argument-hint: Summarize the main purpose of the pull request
---
Collect the code changes compared to origin/main.
Compare the commited changes with origin/main. Use the diff. Inspect all commits on the feature branch compared to origin/main. Do ignore all changes on the working directory.
Do not list the files changed (these are apparent from the git diff). Just summarize for a human what changes were done very brief. Use bullet points to separate concepts.

```
## Why?
<reasons for the change>

## What has changed?
<brief description of the changes>

## How to run the code locally (only if applicable):
<instructions for running the code locally>

## How to review the change (expected behavior):
<expected behavior when reviewing the change>
```
Write the description to `pr-description.md` unless asked for a code block return.
