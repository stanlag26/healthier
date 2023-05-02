

String formatDateTime(DateTime dateTime) {
  return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}';
}

String periodString(int num) {
  switch(num){
    case 0:
      return 'Ежедневно';
    case 1:
      return 'Через день';
    case 2:
      return 'Через 2 дня';
    default:
      return 'Ежедневно';
  }
}