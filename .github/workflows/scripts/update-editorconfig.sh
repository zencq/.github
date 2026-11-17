#!/bin/sh
# Regenerates the Modern C# template part of .editorconfig and keeps the zencq additions below it.
# The template is the one the dotnet-build-errors-and-warnings directive of agentic.check expects;
# it stays unchanged so it can be regenerated, and everything from MARKER on is carried over.
set -eu

MARKER='#### zencq additions ####'

cd "$(dirname "$0")/../../.."
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

sed -n "/^$MARKER\$/,\$p" .editorconfig > "$work/additions"
if [ ! -s "$work/additions" ]; then
  echo "The marker '$MARKER' is missing in .editorconfig." >&2
  exit 1
fi

dotnet new install Modern.CSharp.Templates --force > /dev/null
dotnet new mcs-editorconfig --skipmanualinstructions --output "$work/template" > /dev/null

# The template is written with a BOM; the additions set charset = utf-8, so it is removed.
{
  sed '1s/^\xEF\xBB\xBF//' "$work/template/.editorconfig"
  echo
  cat "$work/additions"
} > .editorconfig
