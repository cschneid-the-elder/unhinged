#! /bin/bash

process() {
  for word in $REPLY
  do
    let c=$((c + 1))
    wc="$(echo $REPLY | wc -w)"
    if [[ $BASH_VERSINFO < 4 ]]
    then
      uword="$(echo $word | tr '[a-z]' '[A-Z]')"
    else
      uword="${word^^}"
    fi
    if [[ $uword == $word || $word =~ ^[0-9] ]]
    then
      printf "$word "
    else
      r="$((1 + RANDOM % 100))"
      if [[ $r -lt 9 ]]
      then
        r1="$((1 + RANDOM % 100))"
        if [[ $r1 -lt 20 ]]
        then
          e="!"
        else
          e=""
        fi
        if [[ $sw -eq 1 || $word =~ ^\" ]]
        then
          printf "$uword$e "
          sw=0
        else
          printf "\"$word$e\" "
          sw=1
        fi
      else
        printf "$word "
      fi
    fi
    if [[ $c -eq $wc ]]
    then
      printf "\n\n"
    fi
  done
  let c=0
}

let c=0
while read
do
  process
done

process

exit 0

