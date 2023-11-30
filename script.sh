if test -f "./configurationFile.txt"; then
echo "$FILE exists."
else
pwd > configurationFile.txt
fi
tt=$(head configurationFile.txt)
mkdir $tt
cp ./configurationFile.txt $tt
rm $tt/id.txt
docker run --platform linux/amd64 -idv $tt:/sharedFolder --memory-reservation=10g -v /var/run/docker.sock:/var/run/docker.sock --cidfile  $tt/id.txt --privileged=true -p  8888:8888 repbioinfo/bcell1
python3 -m webbrowser http://localhost:8888
