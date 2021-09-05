const int maxInt = (double.infinity is int) ? double.infinity as int : ~minInt;
const int minInt = (double.infinity is int) ? -double.infinity as int : (-1 << 63);