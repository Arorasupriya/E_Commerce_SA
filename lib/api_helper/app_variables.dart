import 'package:e_commerce_app/models/config_models/data_model_class.dart';

class AppVariables {
  static const String USER_TOKEN =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTA2YjE0OWIzZjUyM2NjNjUxZWQ2NzRlMWZjOTA2YzFhMzA5NjQwOWI0Njk4MmNjYjFmZWU1NjM4OTMyNWI1YTA2ZDFhMWQzNGE2YmZiNGYiLCJpYXQiOjE3MDI3MzY4NjkuOTQ1NzQxLCJuYmYiOjE3MDI3MzY4NjkuOTQ1NzQzLCJleHAiOjE3MzQzNTkyNjkuOTQwNTg5LCJzdWIiOiIxMiIsInNjb3BlcyI6W119.mxStjCvpF3Cgf5W6bzwxRjIiicgWGW7zq9Fn7ks0z2CEbbfkq4iGY_QLUu7a_qwht0GbuMG55i6qMgAy5rk4zvFdFTbq35NDxPkBejW5LNTD-z37zuyXrSHsk7aRCUGeeWiJ3t-1l5ATQ9G99FL6-29XhoZTtD0qrqG-l24AKjjlDNS6Jt_0hsgyQNgaKupufDSJjew1vae3fNKuLBbjiewgamdo6NsbY0ZSLCQRcKerS4bjMyK586r8-vxqIvoaFSCAnnQDnp_ABFbO28RLRpMuRl51OCpGUpvSLTiLq30zrFM_hoZdBzVuUynFIQlV7EeRioLhV8_NgJaUnDpLXA78edw9dw0LakwBms4_j-DzYi6e0vxReMagBo-NbOYyt2YIyuz__AwHS7KaswCIhvju8eXh2x0bWwq4HK9FdoQV5_puc9HlYF_27BwiTMo6lWlGLALPgFv_HafAwAjqf3F4kYaPaMCkgmK1bgzDhFlhuKKDCDxWi6tyBPm5FNmFnna8esyk_kx4vQ0f_XL2rvfaRzuk7ZGyLOH8XEfcBiZhxxQffYzbHFSjmllrnI1r8LictZH_RHsVU2uVXsFOa2wV4yUOStV1ZI-f16npIfpje4gMdyWlKe7YB7_DaAG-ChtIrtqCMXfePG1gFSTgBejM7FgRhflP6Yf3GUnrhIs";
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
  static const String registerURL =
      "https://www.infusevalue.live/api/v1/auth/register";
  static const String loginURL =
      "https://www.infusevalue.live/api/v1/auth/login";
}
