// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'herbals.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HerbalAdapter extends TypeAdapter<Herbal> {
  @override
  final int typeId = 0;

  @override
  Herbal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Herbal(
      id: fields[0] as String,
      name: fields[1] as String,
      uses: fields[2] as String,
      scientific: fields[3] as String,
      definition: fields[4] as String,
      benefits: fields[5] as String,
      location: fields[6] as String,
      category: fields[7] as String,
      imageUrl: fields[8] as String,
      type: fields[9] as String,
      image1: fields[10] as String,
      image2: fields[11] as String,
      image3: fields[12] as String,
      image4: fields[13] as String,
      image5: fields[14] as String,
      color: fields[15] as String,
      addons: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Herbal obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.uses)
      ..writeByte(3)
      ..write(obj.scientific)
      ..writeByte(4)
      ..write(obj.definition)
      ..writeByte(5)
      ..write(obj.benefits)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.imageUrl)
      ..writeByte(9)
      ..write(obj.type)
      ..writeByte(10)
      ..write(obj.image1)
      ..writeByte(11)
      ..write(obj.image2)
      ..writeByte(12)
      ..write(obj.image3)
      ..writeByte(13)
      ..write(obj.image4)
      ..writeByte(14)
      ..write(obj.image5)
      ..writeByte(15)
      ..write(obj.color)
      ..writeByte(16)
      ..write(obj.addons);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HerbalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
