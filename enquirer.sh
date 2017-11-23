
while true; do
  read -p "$1 $2 (y/n) : " yn
  case $yn in
    [Yy]* ) echo "Y"; break ;;
    [Nn]* ) echo "N"; break ;;
    * ) ;;
  esac
done
