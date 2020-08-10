void main() {
List<int> data = [1,2,3,4];
  print(data[2]);
// 1번 문제 



List<Map<String, String>> data1 = [  
  {
    "key1":"value1"
    },
  {"key2":"value2"
   },
  {
    "key3":"value3"
    },

];
  
 print(data1[0]["key1"]);
 //2번 문제

  List<Map<String, dynamic>> data3 = [
     {
    "title":"title1",
    "img":"src",
    "datas":[ 1,2,3 ]
  },
  {
    "title":"title2",
    "img":"src",
    "datas":[ 4,5,6 ]
  },
  ];
  
  print(data3[1]["datas"]);
  //3번 문제 

    List<Map<String, dynamic>> data4 = [
    {
    "title":"title1",
    "img":"src",
    "datas":[
      {"title":"subTitle1", "des":"des1"},
      {"title":"subTitle2", "des":"des2"},
      {"title":"subTitle3", "des":"des3"},
    ]
  },
  {
    "title":"title2",
    "img":"src",
    "datas":[
      {"title":"subTitle1", "des":"des1"},
      {"title":"subTitle2", "des":"des2"},
      {"title":"subTitle3", "des":"des3"},
    ]
  },
  ];
  
  print(data4[1]["datas"][1]["title"]);
  //4번 문제^^
}  


  
