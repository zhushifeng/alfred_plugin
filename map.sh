

#alfred plugin, using like route  A|B  by option + space
#  After query google, the route copy the address to clipboard, the route name can be used in next action
#  

#route 

destination=${query}
from=`echo ${destination%|*} | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g'`
to=`echo ${destination#*|} | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g'`

echo $from
echo $to

url="https://maps.google.com/maps?saddr=${from}&daddr=${to}&&dirflg=r"

echo $url

# copy the file 

echo "${destination%|*}_TO_${destination#*|}" |  tr 'A-Z' 'a-z' | tr -s ' ' | tr ' ' '_' |  tr -d "\n" | pbcopy

open -a Safari $url



