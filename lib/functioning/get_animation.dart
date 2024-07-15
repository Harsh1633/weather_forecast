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