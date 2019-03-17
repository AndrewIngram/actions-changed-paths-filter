# GitHub Action for filtering on changed paths

This action will let you filter on whether changes against the base branch (usually master) match one or more file glob patterns. Useful for only running certain actions if applicable changes are made, for example only building the docs if the `docs` folder has changed.

## Usage

```hcl
workflow "Build documentation if necessary" {
  on = "push"
  resolves = ["Build documentation"]
}

action "If /docs Changed" {
  uses = "AndrewIngram/actions-changed-paths-filter"
  args = "docs"
}

action "Build documentation" {
  uses = "actions/npm@master"
  needs = ["If /docs Changed"]
  args = "docs"
}
```

If you want to check changes against a branch other than master, provide a `BASE_BRANCH` environment variable.
