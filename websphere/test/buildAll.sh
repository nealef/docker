#!/bin/bash

#####################################################################################
#                                                                                   #
#  Script to build and test all websphere-liberty Docker images                     #
#                                                                                   #
#                                                                                   #
#  Usage : buildAll.sh							            # 
#                                                                                   #
#####################################################################################

docker pull sinenomine/java-s390x:latest

while read -r imageName buildContextDirectory
do
  ./build.sh $imageName $buildContextDirectory && ./verify.sh $imageName
   
  if [ $? != 0 ]; then
    echo "Failed at image $imageName - exiting"
    exit 1
  fi
    
done < "images.txt"
