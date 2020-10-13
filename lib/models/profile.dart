class Profile {
    String date_birth;
    int id;
    bool is_partner_store;
    int person_status;
    int person_type;
    int phone;
    String photo;
    int sex_type;

    Profile({this.date_birth, this.id, this.is_partner_store, this.person_status, this.person_type, this.phone, this.photo, this.sex_type});

    factory Profile.fromJson(Map<String, dynamic> json) {
        return Profile(
            date_birth: json['date_birth'], 
            id: json['id'], 
            is_partner_store: json['is_partner_store'], 
            person_status: json['person_status'], 
            person_type: json['person_type'], 
            phone: json['phone'], 
            photo: json['photo'], 
            sex_type: json['sex_type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date_birth'] = this.date_birth;
        data['id'] = this.id;
        data['is_partner_store'] = this.is_partner_store;
        data['person_status'] = this.person_status;
        data['person_type'] = this.person_type;
        data['phone'] = this.phone;
        data['photo'] = this.photo;
        data['sex_type'] = this.sex_type;
        return data;
    }
}