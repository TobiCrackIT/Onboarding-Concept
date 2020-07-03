class Config{
  String appTitle;
  String appSubtitle;
  bool isRelease;

  Config(){
    isRelease=const bool.fromEnvironment("dart.vm.product");

    if(isRelease){
      appTitle='Release Version';
      appSubtitle='It\'s the release version';
    }else{
      appTitle='Debug Version';
      appSubtitle='It\'s the debug version';
    }
  }
}