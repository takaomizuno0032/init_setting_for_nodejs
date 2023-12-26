#! /usr/bin bash

project_names=($(find . -maxdepth 1 -type d))

exclude_projects=('./.git')

containExcludeProject() {

    for i in "${exclude_projects[@]}"; do
        if [ "$i" = "$1" ]; then
            return 0

        fi
    done
    return 1
}

for dir in "${project_names[@]}"; do
    if containExcludeProject $dir; then
        echo "$dir is not target."
    else
        echo "$dir is target"
        (cd "$dir" && yarn add -D --exact prettier)
    fi
done
