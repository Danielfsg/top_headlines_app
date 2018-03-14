class Utils {

  static String capitalizeString(var st) {
    return "${st[0].toUpperCase()}${st.substring(1)}";
  }

  static String formatDate(var st) {
    return "${st.substring(0, 10)}  ${st.substring(11, 16) }";
  }
}