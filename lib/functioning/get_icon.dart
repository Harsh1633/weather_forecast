get_icon(String main_condition){
  main_condition= main_condition.toLowerCase();
  if (main_condition.contains('clear')){
    return 'agriculture.png';
  }
  else if(main_condition.contains('sun')){
    return 'sun.png';
  }
  else if(main_condition.contains('rain')||main_condition.contains('sleet')||
      main_condition.contains('drizzle')){
    return 'kid.png';
  }
  else if(main_condition.contains('snow')){
    return 'snowman.png';
  }
  else if (main_condition.contains('storm') || (main_condition.contains('thunder'))){
    return 'storm.png';
  }
  else if (main_condition.contains('mist')){
    return 'mist.png';
  }
  else{
    return 'cloud.png';
  }

}