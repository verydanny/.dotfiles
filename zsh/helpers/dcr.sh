#!/usr/bin/env zsh

alias dockup="docker compose up"

load_env() {
  env_files=("$(find ~ -iname ".env*" -maxdepth 1)")

  if [ ${#env_files[@]} -gt 0 ]; then
    for envfile in "${env_files[@]}"; do
      if [ -f "$envfile" ]; then
        source "$envfile"
      fi
    done
  fi
}

dcr() {
  docker compose run --rm "$@"
}

dcrdb() {
  load_env

  if [ -n "${DB_USER:-}" ] && [ -n "${DB_SECRET:-}" ]; then
    dcr -e PGPASSWORD="$DB_SECRET" db psql -U "$DB_USER" -h db -w
  fi 
}

dcrapp() {
  dcr app python manage.py "$@" 
}
