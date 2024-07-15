
getCoord(double latitude,double longitude){
  String latDir='',lonDir='';
  if(latitude>0){
    latDir= "N";
  }
  else{
    latDir= "S";
    latitude= latitude*(-1);
  }


  if(longitude>0){
    lonDir= "W";
  }
  else{
    lonDir="E";
    longitude= longitude*(-1);
  }
    return "${latitude.toString()} °$latDir , "
        "${longitude.toString()} °$lonDir";
  }

