

class AppLanguage{
  

  bool isBangla=false;


  Map<int,String> En={
    0:'She ',
    1:'Welcome To Beauty App',
    2:'Usename',
    3:'Password',
    4:'Forget password',
    5:'Remember ME',
    6:"Category",
    7:"Provider",
    8:"Near Me",
    9:'View All',
    10:'Login',
    11:"Don't have account",
    12:'SignUp',
    13:'All Provider',
    14:'Book Now',
    15:'View All',
    16:"Category : ",
    17:"Sub-Category : ",
    18:"Service price : ",
    19:"Gender : ",
    20:"Price",
    21:"Provider Availability : ",
    22:"Time",
    23:"Time Slot",
    24:'Choose Time',
    25:'Product Quantity',
    26:'Total ',
    27:'Service Quantity',
    28:'Total Services',
    29:'Certifications',
    30:'Services',
    31:'View All',
    32:'View All',
    33:'View All',
    34:'View All',
    35:'View All',
    36:'View All',
    37:'View All',
    38:'View All',
    39:'View All',
    40:'View All',
    41:'View All',
    42:'View All',
    43:'View All',
    44:'View All',
    45:'View All',
    46:'View All',
    47:'View All',
    48:'View All',
    49:'View All',
    50:'View All',
    51:'View All',
    52:'View All',
    53:'View All',
    54:'View All',
    55:'View All',
    56:'View All',
    57:'View All',
    58:'View All',
    59:'View All',
    60:'View All',
    61:'View All',
    62:'View All',
    63:'View All',
    64:'View All',
    65:'View All',
    66:'View All',
    67:'View All',
    68:'View All',
    69:'View All',
    70:'View All',
    

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


 getLang(id)=> isBangla?Bn[id]:En[id];
  
}