class DetailStory {
    String by;
    int descendants;
    int id;
    List<int> kids;
    int score;
    String text;
    int time;
    String title;
    String type;

    DetailStory({this.by, this.descendants, this.id, this.kids, this.score, this.text, this.time, this.title, this.type});

    factory DetailStory.fromJson(Map<String, dynamic> json) {
        return DetailStory(
            by: json['by'],
            descendants: json['descendants'],
            id: json['id'],
            kids: json['kids'] != null ? new List<int>.from(json['kids']) : null,
            score: json['score'],
            text: json['text'],
            time: json['time'],
            title: json['title'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['by'] = this.by;
        data['descendants'] = this.descendants;
        data['id'] = this.id;
        data['score'] = this.score;
        data['text'] = this.text;
        data['time'] = this.time;
        data['title'] = this.title;
        data['type'] = this.type;
        if (this.kids != null) {
            data['kids'] = this.kids;
        }
        return data;
    }
}