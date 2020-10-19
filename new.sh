#!/bin/bash
[[ -z "$1" ]] && echo "Usage: $(basename "$0") FILENAME(without suffix) [SECTIONNAME]" && exit 1
section_name=${2:-posts}
date_prefix=$(date +%Y-%m-%d)
file_path="${section_name}/${date_prefix}/$1.md"
hugo new "${file_path}"
sed -i '.bak' "s/slug: ${date_prefix}/slug: /" "content/${file_path}"
rm -f "content/${file_path}.bak"