// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'professional_entity.dart';

class ProfessionalEntityMapper extends ClassMapperBase<ProfessionalEntity> {
  ProfessionalEntityMapper._();

  static ProfessionalEntityMapper? _instance;
  static ProfessionalEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfessionalEntityMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ProfessionalEntity';

  static int _$profissionalId(ProfessionalEntity v) => v.profissionalId;
  static const Field<ProfessionalEntity, int> _f$profissionalId =
      Field('profissionalId', _$profissionalId);
  static String _$nome(ProfessionalEntity v) => v.nome;
  static const Field<ProfessionalEntity, String> _f$nome =
      Field('nome', _$nome);
  static double _$latitude(ProfessionalEntity v) => v.latitude;
  static const Field<ProfessionalEntity, double> _f$latitude =
      Field('latitude', _$latitude);
  static double _$longitude(ProfessionalEntity v) => v.longitude;
  static const Field<ProfessionalEntity, double> _f$longitude =
      Field('longitude', _$longitude);
  static String? _$email(ProfessionalEntity v) => v.email;
  static const Field<ProfessionalEntity, String> _f$email =
      Field('email', _$email);
  static String _$endereco(ProfessionalEntity v) => v.endereco;
  static const Field<ProfessionalEntity, String> _f$endereco =
      Field('endereco', _$endereco);
  static String? _$telefone(ProfessionalEntity v) => v.telefone;
  static const Field<ProfessionalEntity, String> _f$telefone =
      Field('telefone', _$telefone);
  static String _$descricao(ProfessionalEntity v) => v.descricao;
  static const Field<ProfessionalEntity, String> _f$descricao =
      Field('descricao', _$descricao);
  static String _$diasFuncionamento(ProfessionalEntity v) =>
      v.diasFuncionamento;
  static const Field<ProfessionalEntity, String> _f$diasFuncionamento =
      Field('diasFuncionamento', _$diasFuncionamento);
  static String _$horario(ProfessionalEntity v) => v.horario;
  static const Field<ProfessionalEntity, String> _f$horario =
      Field('horario', _$horario);

  @override
  final Map<Symbol, Field<ProfessionalEntity, dynamic>> fields = const {
    #profissionalId: _f$profissionalId,
    #nome: _f$nome,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #email: _f$email,
    #endereco: _f$endereco,
    #telefone: _f$telefone,
    #descricao: _f$descricao,
    #diasFuncionamento: _f$diasFuncionamento,
    #horario: _f$horario,
  };

  static ProfessionalEntity _instantiate(DecodingData data) {
    return ProfessionalEntity(
        profissionalId: data.dec(_f$profissionalId),
        nome: data.dec(_f$nome),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        email: data.dec(_f$email),
        endereco: data.dec(_f$endereco),
        telefone: data.dec(_f$telefone),
        descricao: data.dec(_f$descricao),
        diasFuncionamento: data.dec(_f$diasFuncionamento),
        horario: data.dec(_f$horario));
  }

  @override
  final Function instantiate = _instantiate;

  static ProfessionalEntity fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ProfessionalEntity>(map));
  }

  static ProfessionalEntity fromJson(String json) {
    return _guard((c) => c.fromJson<ProfessionalEntity>(json));
  }
}

mixin ProfessionalEntityMappable {
  String toJson() {
    return ProfessionalEntityMapper._guard(
        (c) => c.toJson(this as ProfessionalEntity));
  }

  Map<String, dynamic> toMap() {
    return ProfessionalEntityMapper._guard(
        (c) => c.toMap(this as ProfessionalEntity));
  }

  ProfessionalEntityCopyWith<ProfessionalEntity, ProfessionalEntity,
          ProfessionalEntity>
      get copyWith => _ProfessionalEntityCopyWithImpl(
          this as ProfessionalEntity, $identity, $identity);
  @override
  String toString() {
    return ProfessionalEntityMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProfessionalEntityMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ProfessionalEntityMapper._guard((c) => c.hash(this));
  }
}

extension ProfessionalEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProfessionalEntity, $Out> {
  ProfessionalEntityCopyWith<$R, ProfessionalEntity, $Out>
      get $asProfessionalEntity =>
          $base.as((v, t, t2) => _ProfessionalEntityCopyWithImpl(v, t, t2));
}

abstract class ProfessionalEntityCopyWith<$R, $In extends ProfessionalEntity,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? profissionalId,
      String? nome,
      double? latitude,
      double? longitude,
      String? email,
      String? endereco,
      String? telefone,
      String? descricao,
      String? diasFuncionamento,
      String? horario});
  ProfessionalEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProfessionalEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProfessionalEntity, $Out>
    implements ProfessionalEntityCopyWith<$R, ProfessionalEntity, $Out> {
  _ProfessionalEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProfessionalEntity> $mapper =
      ProfessionalEntityMapper.ensureInitialized();
  @override
  $R call(
          {int? profissionalId,
          String? nome,
          double? latitude,
          double? longitude,
          Object? email = $none,
          String? endereco,
          Object? telefone = $none,
          String? descricao,
          String? diasFuncionamento,
          String? horario}) =>
      $apply(FieldCopyWithData({
        if (profissionalId != null) #profissionalId: profissionalId,
        if (nome != null) #nome: nome,
        if (latitude != null) #latitude: latitude,
        if (longitude != null) #longitude: longitude,
        if (email != $none) #email: email,
        if (endereco != null) #endereco: endereco,
        if (telefone != $none) #telefone: telefone,
        if (descricao != null) #descricao: descricao,
        if (diasFuncionamento != null) #diasFuncionamento: diasFuncionamento,
        if (horario != null) #horario: horario
      }));
  @override
  ProfessionalEntity $make(CopyWithData data) => ProfessionalEntity(
      profissionalId: data.get(#profissionalId, or: $value.profissionalId),
      nome: data.get(#nome, or: $value.nome),
      latitude: data.get(#latitude, or: $value.latitude),
      longitude: data.get(#longitude, or: $value.longitude),
      email: data.get(#email, or: $value.email),
      endereco: data.get(#endereco, or: $value.endereco),
      telefone: data.get(#telefone, or: $value.telefone),
      descricao: data.get(#descricao, or: $value.descricao),
      diasFuncionamento:
          data.get(#diasFuncionamento, or: $value.diasFuncionamento),
      horario: data.get(#horario, or: $value.horario));

  @override
  ProfessionalEntityCopyWith<$R2, ProfessionalEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProfessionalEntityCopyWithImpl($value, $cast, t);
}
