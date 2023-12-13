import 'package:e_commerce_app/models/config_models/data_model_class.dart';

class AppVariables {
  static const String USER_TOKEN =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmRkNTg1Nzc2YWE1ZWMzNTFhOThiZDk2ZjBhYmZiZGUyNmUxMzM1YTkyZjE1NDRiMjQzZDkzMDg3MWUyZTk2ZTA2MGE5NjcxMjk4NDI3ZGYiLCJpYXQiOjE3MDIzOTA5OTYuMjMyMTAzLCJuYmYiOjE3MDIzOTA5OTYuMjMyMTA1LCJleHAiOjE3MzQwMTMzOTYuMjI3MDczLCJzdWIiOiIxMiIsInNjb3BlcyI6W119.VnRrDChoi3K8PQ00wpkvmW9bn3_qESpclPmV9xC_DpfIH4x_ACMXw6sXKadbydZiAlmO1YiSsANBitbznQtiXv3KoRBQXHPjEQdO0xT9fnyIDYZQDEBjuHtofazPjBpfbydQFWIKDoeubqS8I0vP2GsblM0wLWNEVdx6m2OJj2T8dGvYiTMURIa4UyDQKuoHrEfuoNWdngPRFKX7xR2nAtUfc87JZA8kpzpnNfxQGF4f780bNPTPUDrilKCdnnvBrCaUsfCL59aWDFIImEjN17ro1cr1BpH5R4F9xLuMayo1Ms5PIPdVPnytnAEiRbcsZWEIl6k0x6XoFDVz0jsUZ-VmrGms98pGoXc02so8x6PN5YdGQofEKPYWgGi9o3cer2aB0Qis8lbSFZjyEkQQkAJ63aKu4FxamOG2vs4huIdQ9DKgd_3o1HM3pDpsYWqr5zvuf1KX9HKaiYqkORw32igU0WhF06yhwquOfGGJzc54DXJqkOECgAWNrfcmGMe-WJBykCwJvjGnu2L82JrtbXad0rHBqwU2o8e9isBbcYzgsGvBAzUJ7gzM2M2y_B4GFOC9F2thMpNPhmAbW41DmYgrqlizIytemxCfHVzswJzEUC8bw04t5RmMKUuA6WF86s1JuHhd0ElW2-YXPQJclDsgqeCRpvzu_JYUQbtiLVU";
  static BaseUrls? baseUrls;
  static const String configURL = "https://www.infusevalue.live/api/v1/config";
  static const String categoryListURL =
      "https://www.infusevalue.live/api/v1/categories";
  static const String bannerURL =
      "https://www.infusevalue.live/api/v1/banners?banner_type=";
  static const String productBasePath =
      "https://www.infusevalue.live/api/v1/products/";

  static const String cartAddURL =
      "https://www.infusevalue.live/api/v1/cart/add";
  static const String cartListURL = "https://www.infusevalue.live/api/v1/cart";
}
