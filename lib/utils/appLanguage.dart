import 'dart:ffi';

mixin ApppLanguage{
  bool isBangla=false;


  Map<int,String> En={
    0:'',
    1:'',
    2:'',
    3:'',
    4:'',
    5:'',
    6:'',
    7:'',
    8:'',
    9:'',

  };
   Map<int,String> Bn={
    0:'',
    1:'',
    2:'',
    3:'',
    4:'',
    5:'',
    6:'',
    7:'',
    8:'',
    9:'',

  };


  getLang(id)=> isBangla?En[id]:Bn[id];
  
}