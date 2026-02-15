
class Helpers{
  getAnimation(String mainCondition){
    mainCondition= mainCondition.toLowerCase();
    if (mainCondition.contains('clear')||mainCondition.contains('sunny') ){
      return 'sunny.json';

    }
    else if(mainCondition.contains('thunder')){
      return 'thunder.json';
    }
    else if(mainCondition.contains('rain')||mainCondition.contains('sleet')||
        mainCondition.contains('drizzle')){
      return 'rain_new.json';
    }
    else if(mainCondition.contains('snow')){
      return 'snowy.json';
    }
    else{
      return 'cloudss.json';
    }

  }


  getCoordinates(double latitude, double longitude) {
    String latDir = '', lonDir = '';

    //latitude
    if (latitude > 0) {
      latDir = "N";
    } else {
      latDir = "S";
      latitude = latitude * (-1);
    }

    //longitude
    if (longitude > 0) {
      lonDir = "W";
    } else {
      lonDir = "E";
      longitude = longitude * (-1);
    }

    return "${latitude.toStringAsFixed(2)} °$latDir, "
        "${longitude.toStringAsFixed(2)} °$lonDir";
  }



  getIcon(String mainCondition){
    mainCondition= mainCondition.toLowerCase();
    if (mainCondition.contains('clear')||mainCondition.contains('sun') ){
      return 'rainbow.png';

    }
    else if(mainCondition.contains('rain')||mainCondition.contains('sleet')||
        mainCondition.contains('drizzle')){
      return 'kid.png';
    }
    else if(mainCondition.contains('snow')){
      return 'snowman.png';
    }
    else if (mainCondition.contains('storm') || (mainCondition.contains('thunder'))){
      return 'storm.png';
    }
    else{
      return 'cloud.png';
    }

  }
}