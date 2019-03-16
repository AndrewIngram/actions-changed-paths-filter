FROM alpine:3.9

LABEL "repository"="https://github.com/AndrewIngram/actions-changed-directory-filter"
LABEL "homepage"="https://github.com/AndrewIngram/actions-changed-directory-filter"
LABEL "maintainer"="Andrew Ingram <andy@andrewingram.net>"

LABEL "com.github.actions.name"="Changed Directory Filter for GitHub Actions"
LABEL "com.github.actions.description"="Filter based on changes against the base branch"
LABEL "com.github.actions.icon"="filter"
LABEL "com.github.actions.color"="gray-dark"

RUN apk add --no-cache bash git
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
