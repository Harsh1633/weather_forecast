
get_coord(double longitude){
  if(longitude >0){
    return "E";
  }
  else if (longitude<0){
    // longitude= longitude.abs();
    return "W";

  }
  else{
    return "0.0";

  }
}