import 'package:intl/intl.dart';

class Util{
  static String appId = "b2009a033e88ff3b64e2a74325fe2228";

  static String getFormmatedDate(DateTime dateTime){
    return new DateFormat("EEE, MMM d, y").format(dateTime);
  }

}