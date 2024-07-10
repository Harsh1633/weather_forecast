
get_coord(double latitude,double longitude){
  String lat_dir='',lon_dir='';
  if(latitude>0){
    lat_dir= "N";
  }
  else{
    lat_dir= "S";
    latitude= latitude*(-1);
  }


  if(longitude>0){
    lon_dir= "W";
  }
  else{
    lon_dir="E";
    longitude= longitude*(-1);
  }
    return "${latitude.toString()} °${lat_dir} , "
        "${longitude.toString()} °${lon_dir}";
  }

