get_formatted_text(String condition){
  condition=condition.toLowerCase();
  condition= condition.replaceAll('shower', '');
  condition= condition.replaceAll('nearby', '');
  condition= condition.replaceAll(' in', '');

  if (condition.contains('moderate') && condition.contains('heavy')) {
    condition= condition.replaceAll('heavy', '');
    condition= condition.replaceAll('or', '');
  }

  return condition;

}