#!/usr/bin/env fish

function get_profile_content
  curl -L 'https://github.com/fa7ad/fa7ad'
end

function get_camo_links
  get_profile_content |
  grep --extended-regexp --only-matching 'src="(.*?)"' |
  grep camo | cut -d'"' -f2
end

for link in (get_camo_links)
  echo Flushing '"'$link'"'
  curl -X PURGE $link
  echo ""
end

echo "Done!"