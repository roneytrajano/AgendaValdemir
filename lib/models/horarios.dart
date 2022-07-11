class Horarios {
  int? horarioId;
  String? situacao;
  int? order;
  String? label;
  Cliente? cliente;
  String? corSituacao;

  Horarios({this.situacao, this.order, this.label, this.cliente, this.corSituacao});

  Horarios.fromJson(Map<String, dynamic> json) {
    horarioId = json['HorarioId'];
    situacao = json['Situacao'];
    order = json['Order'];
    label = json['Label'];
    cliente =
    json['Cliente'] != null ? new Cliente.fromJson(json['Cliente']) : null;
    corSituacao = json['CorSituacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Situacao'] = this.situacao;
    data['Order'] = this.order;
    data['Label'] = this.label;
    if (this.cliente != null) {
      data['Cliente'] = this.cliente!.toJson();
    }
    data['Situacao'] = this.corSituacao;
    return data;
  }
}

class Cliente {
  int? id;
  String? nome;
  String? telefone;

  Cliente({this.id, this.nome, this.telefone});

  Cliente.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nome = json['Nome'];
    telefone = json['Telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Nome'] = this.nome;
    data['Telefone'] = this.telefone;
    return data;
  }
}