#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

declare -a phases=(
  "01__fundamentals|Components, hierarchy, file types"
  "02__navigation|Paths, ls, directories"
  "03__file-operations|Create, copy, move, symlinks"
  "04__viewing-comparing|cat, less, diff"
  "05__text-processing|wc, sort, paste, tr"
  "06__streams-pipes|Redirection, pipes, tee, xargs"
  "07__find-locate|locate, find"
  "08__regex-grep|Regular expressions, grep"
  "09__permissions|Permissions, umask, sudo"
  "10__editors|vi and vim"
  "11__shell-basics|Scripts, variables, arguments, environment"
  "12__control-flow|Tests, case, loops"
  "13__arrays-functions|Arrays, functions"
  "14__sed-awk|sed, awk, jq, YAML basics"
  "15__advanced-scripting|trap, getopts, strict mode"
  "16__users-groups|Users and groups"
  "17__processes-services|Processes, signals, systemd, cron"
  "18__networking-ssh|Networking, SSH, curl, firewalls"
  "19__storage-packages|Disks, filesystems, packages, archives"
  "20__logging-monitoring|Logs, performance tools"
  "21__security-hardening|SSH hardening, firewalls, SELinux"
  "22__devops-toolchain|Containers, cloud, Git, Ansible, make"
  "23__projects|Full shell projects"
  "24__resources|Cheat sheets, references"
)

create_directory() {
  mkdir -p -- "$1"
}

create_file_if_missing() {
  local file_path="$1"
  shift

  if [[ -e "$file_path" ]]; then
    return
  fi

  printf '%s\n' "$@" > "$file_path"
}

create_directory "$repo_root/assets/images"
create_directory "$repo_root/assets/diagrams"

for phase in "${phases[@]}"; do
  phase_directory="${phase%%|*}"
  phase_focus="${phase#*|}"
  phase_path="$repo_root/$phase_directory"
  phase_title="${phase_directory##*_}"

  create_directory "$phase_path/documentation"
  create_directory "$phase_path/lab/scripts"
  create_directory "$phase_path/lab/data"

  create_file_if_missing "$phase_path/README.md" \
    "# ${phase_title}" \
    "" \
    "$phase_focus" \
    "" \
    "## Contents" \
    "" \
    "- \`documentation/\`: Written lessons" \
    "- \`lab/scripts/\`: Practice scripts" \
    "- \`lab/data/\`: Sample files used by the scripts" \
    "- \`lab/exercises.md\`: Practice questions with answers"

  create_file_if_missing "$phase_path/lab/exercises.md" \
    "# Exercises: ${phase_title}" \
    "" \
    "Practice questions with answers."
done

printf 'Scaffold ready at %s\n' "$repo_root"