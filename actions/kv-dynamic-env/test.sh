s = '{"a"="ak", "b"="bk", "c"="ck"}'
kv = '{"a"="av", "b"="bv", "c"="cv"}'

for k in $(echo $s | jq -r 'keys[]'); do
  newkey=$(echo $s | jq -r ".$k")
  newval=$(echo $kv | jq -r ".$k")
  echo "$newkey=$newval"
done

l='["a", "b", "c"]'

# use jq to check if string is json array or json object if it is neither print unsupported
if [[ "$(echo $l | jq --raw-output type)" == "array" ]]; then
  echo "array"
elif [[ "$(echo $l | jq --raw-output type)" == "object" ]]; then
  echo "object"
else
  echo "unsupported"
fi
