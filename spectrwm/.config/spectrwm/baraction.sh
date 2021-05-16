#!/usr/bin/env sh

mem(){
  mem=`free | awk '/Mem/ {printf "%d/%d \n", $3 / 1024.0, $2 / 1024.0 }'`
  echo "Mem: $mem"
}

vol(){
  vol="$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1)"
  echo "Vol: $vol%"
}

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.2
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo "CPU: $cpu%"
}

temp(){
  temp="$(perl ~/.scripts/temps | tail -n 3 | head -n 1 | awk '{print $3}')"
  echo "Temp: $temp F"
}

dte(){
  dte="$(date +"%Y.%m.%d")"
  time="$(date +"%c" | awk '{print $5}' | cut -c 1-5)"
  echo "$dte  $time"
}

while :; do
    #echo "| $(cpu) | $(temp) | $(mem) | $(vol) |"
  echo "+@fg=2;|+@fg=0;  $(cpu)  +@fg=2;|+@fg=0;   $(temp)  +@fg=2;|+@fg=0;   $(mem)  +@fg=2;|+@fg=0;   $(vol)  +@fg=2;|+@fg=0;   $(dte)  "
  sleep 5
done

