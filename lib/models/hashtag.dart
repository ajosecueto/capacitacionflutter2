class Hashtag {
    String created_at;
    String description;
    int hash;
    int id;
    bool status;

    Hashtag({this.created_at, this.description, this.hash, this.id, this.status});

    factory Hashtag.fromJson(Map<String, dynamic> json) {
        return Hashtag(
            created_at: json['created_at'], 
            description: json['description'], 
            hash: json['hash'], 
            id: json['id'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['hash'] = this.hash;
        data['id'] = this.id;
        data['status'] = this.status;
        return data;
    }
}