///
/// Created by Handy on 21/06/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class NetworkUtils {

  static String code (String code) {

    String result = "";

    switch (code) {
      case "400":
        result += "Status $code - Bad Request";
        break;
      case "401":
        result += "Status $code - Not Authorized";
        break;
      case "402":
        result += "Status $code - Payment Required";
        break;
      case "403":
        result += "Status $code - Forbidden";
        break;
      case "404":
        result += "Status $code - Data Not Found";
        break;
      case "405":
        result += "Status $code - Method Not Allowed";
        break;
      case "406":
        result += "Status $code - Not Acceptable";
        break;
      case "407":
        result += "Status $code - Proxy Authentication Required";
        break;
      case "408":
        result += "Status $code - Request Timeout";
        break;
      case "409":
        result += "Status $code - Request Conflicts";
        break;
      case "410":
        result += "Status $code - Request is Gone";
        break;
      case "411":
        result += "Status $code - Length Required";
        break;
      case "412":
        result += "Status $code - Precondition Failed";
        break;
      case "413":
        result += "Status $code - Payload Too Large";
        break;
      case "414":
        result += "Status $code - URI Too Long";
        break;
      case "415":
        result += "Status $code - Unsupported Media Type";
        break;
      case "416":
        result += "Status $code - Range Not Satisfiable";
        break;
      case "417":
        result += "Status $code - Expectation Failed";
        break;
      case "418":
        result += "Status $code - I'm a teapot";
        break;
      case "421":
        result += "Status $code - Misdirected Request";
        break;
      case "422":
        result += "Status $code - Too Many Request";
        break;
      case "423":
        result += "Status $code - Locked";
        break;
      case "429":
        result += "Status $code - Too Many Request - locked request";
        break;
      case "500":
        result += "Status $code - Internal Server Error";
        break;
      case "501":
        result += "Status $code - Not Implemented";
        break;
      case "502":
        result += "Status $code - Bad Gateway";
        break;
      case "503":
        result += "Status $code - Service Unavailable";
        break;
      case "504":
        result += "Status $code - Gateway Timeout";
        break;
      case "505":
        result += "Status $code - HTTP Version Not Supported";
        break;
      case "511":
        result += "Status $code - Network Authentication Required";
        break;
      case "900":
        result = "Status $code - No Internet Connection";
        break;
      default:
        result = "Status $code - Unknown Connection Problem";
        break;
    }
    result += "";
    return result;
  }
}
