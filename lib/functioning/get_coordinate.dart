
get_coord(double latitude,double longitude){
  String latDir='',lonDir='';

  //latitude
  if(latitude>0){
    latDir= "N";
  }
  else{
    latDir= "S";
    latitude= latitude*(-1);
  }

  //longitude
  if(longitude>0){
    lonDir= "W";
  }
  else{
    lonDir="E";
    longitude= longitude*(-1);
  }


  return "${latitude.toStringAsFixed(2)} °$latDir, "
        "${longitude.toStringAsFixed(2)} °$lonDir";
  }

