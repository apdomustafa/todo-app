// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_module.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModuleAdapter extends TypeAdapter<TaskModule> {
  @override
  final int typeId = 0;

  @override
  TaskModule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModule(
      title: fields[0] as String?,
      date: fields[3] as String?,
      description: fields[1] as String?,
      priority: fields[5] as int,
      time: fields[4] as String?,
    )..category = fields[6] as CategoryModule;
  }

  @override
  void write(BinaryWriter writer, TaskModule obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.priority)
      ..writeByte(6)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryModuleAdapter extends TypeAdapter<CategoryModule> {
  @override
  final int typeId = 1;

  @override
  CategoryModule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModule(
      categoryName: fields[0] as String?,
      iconCodePoint: fields[1] as int?,
      color: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModule obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.categoryName)
      ..writeByte(1)
      ..write(obj.iconCodePoint)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
