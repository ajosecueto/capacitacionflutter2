class Owner {
    String last_name;
    String name;
    int person_type;
    String username;

    Owner({this.last_name, this.name, this.person_type, this.username});

    factory Owner.fromJson(Map<String, dynamic> json) {
        return Owner(
            last_name: json['last_name'], 
            name: json['name'], 
            person_type: json['person_type'], 
            username: json['username'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['last_name'] = this.last_name;
        data['name'] = this.name;
        data['person_type'] = this.person_type;
        data['username'] = this.username;
        return data;
    }
}