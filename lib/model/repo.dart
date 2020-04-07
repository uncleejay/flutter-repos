class Repo {
 final int totalCount;
 final List<dynamic> items;

// create constructor
Repo({this.totalCount, this.items});

//create factory method
  factory Repo.fromJSON(Map<String, dynamic> json){
    return Repo(
      totalCount: json['total_count'],
      items: json['items']
    );
  }

}