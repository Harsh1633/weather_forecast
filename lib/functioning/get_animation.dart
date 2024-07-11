get_animation(String main_condition){
  main_condition= main_condition.toLowerCase();
  if (main_condition.contains('clear')||main_condition.contains('sunny') ){
    return 'sunny.json';

  }
  else if(main_condition.contains('thunder')){
    return 'thunder.json';
  }
  else if(main_condition.contains('rain')||main_condition.contains('sleet')||
      main_condition.contains('drizzle')){
    return 'rain_new.json';
  }
  else if(main_condition.contains('snow')){
    return 'snowy.json';
  }
  else{
    return 'cloudss.json';
  }

}