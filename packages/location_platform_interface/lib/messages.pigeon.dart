// Autogenerated from Pigeon (v3.0.3), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

enum LocationAccuracy {
  powerSave,
  low,
  balanced,
  high,
  navigation,
}

class LocationData {
  LocationData({
    required this.latitude,
    required this.longitude,
  });

  double latitude;
  double longitude;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['latitude'] = latitude;
    pigeonMap['longitude'] = longitude;
    return pigeonMap;
  }

  static LocationData decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return LocationData(
      latitude: pigeonMap['latitude']! as double,
      longitude: pigeonMap['longitude']! as double,
    );
  }
}

class LocationSettings {
  LocationSettings({
    required this.askForPermission,
    required this.rationaleMessageForPermissionRequest,
    required this.rationaleMessageForGPSRequest,
    required this.useGooglePlayServices,
    required this.askForGooglePlayServices,
    required this.askForGPS,
    required this.fallbackToGPS,
    required this.ignoreLastKnownPosition,
    this.expirationDuration,
    this.expirationTime,
    required this.fastestInterval,
    required this.interval,
    this.maxWaitTime,
    this.numUpdates,
    required this.accuracy,
    required this.smallestDisplacement,
    required this.waitForAccurateLocation,
    this.acceptableAccuracy,
  });

  bool askForPermission;
  String rationaleMessageForPermissionRequest;
  String rationaleMessageForGPSRequest;
  bool useGooglePlayServices;
  bool askForGooglePlayServices;
  bool askForGPS;
  bool fallbackToGPS;
  bool ignoreLastKnownPosition;
  double? expirationDuration;
  double? expirationTime;
  double fastestInterval;
  double interval;
  double? maxWaitTime;
  int? numUpdates;
  LocationAccuracy accuracy;
  double smallestDisplacement;
  bool waitForAccurateLocation;
  double? acceptableAccuracy;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['askForPermission'] = askForPermission;
    pigeonMap['rationaleMessageForPermissionRequest'] = rationaleMessageForPermissionRequest;
    pigeonMap['rationaleMessageForGPSRequest'] = rationaleMessageForGPSRequest;
    pigeonMap['useGooglePlayServices'] = useGooglePlayServices;
    pigeonMap['askForGooglePlayServices'] = askForGooglePlayServices;
    pigeonMap['askForGPS'] = askForGPS;
    pigeonMap['fallbackToGPS'] = fallbackToGPS;
    pigeonMap['ignoreLastKnownPosition'] = ignoreLastKnownPosition;
    pigeonMap['expirationDuration'] = expirationDuration;
    pigeonMap['expirationTime'] = expirationTime;
    pigeonMap['fastestInterval'] = fastestInterval;
    pigeonMap['interval'] = interval;
    pigeonMap['maxWaitTime'] = maxWaitTime;
    pigeonMap['numUpdates'] = numUpdates;
    pigeonMap['accuracy'] = accuracy.index;
    pigeonMap['smallestDisplacement'] = smallestDisplacement;
    pigeonMap['waitForAccurateLocation'] = waitForAccurateLocation;
    pigeonMap['acceptableAccuracy'] = acceptableAccuracy;
    return pigeonMap;
  }

  static LocationSettings decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return LocationSettings(
      askForPermission: pigeonMap['askForPermission']! as bool,
      rationaleMessageForPermissionRequest: pigeonMap['rationaleMessageForPermissionRequest']! as String,
      rationaleMessageForGPSRequest: pigeonMap['rationaleMessageForGPSRequest']! as String,
      useGooglePlayServices: pigeonMap['useGooglePlayServices']! as bool,
      askForGooglePlayServices: pigeonMap['askForGooglePlayServices']! as bool,
      askForGPS: pigeonMap['askForGPS']! as bool,
      fallbackToGPS: pigeonMap['fallbackToGPS']! as bool,
      ignoreLastKnownPosition: pigeonMap['ignoreLastKnownPosition']! as bool,
      expirationDuration: pigeonMap['expirationDuration'] as double?,
      expirationTime: pigeonMap['expirationTime'] as double?,
      fastestInterval: pigeonMap['fastestInterval']! as double,
      interval: pigeonMap['interval']! as double,
      maxWaitTime: pigeonMap['maxWaitTime'] as double?,
      numUpdates: pigeonMap['numUpdates'] as int?,
      accuracy: LocationAccuracy.values[pigeonMap['accuracy']! as int]
,
      smallestDisplacement: pigeonMap['smallestDisplacement']! as double,
      waitForAccurateLocation: pigeonMap['waitForAccurateLocation']! as bool,
      acceptableAccuracy: pigeonMap['acceptableAccuracy'] as double?,
    );
  }
}

class _LocationHostApiCodec extends StandardMessageCodec {
  const _LocationHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is LocationData) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
    if (value is LocationSettings) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return LocationData.decode(readValue(buffer)!);
      
      case 129:       
        return LocationSettings.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}

class LocationHostApi {
  /// Constructor for [LocationHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  LocationHostApi({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _LocationHostApiCodec();

  Future<LocationData> getLocation() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.LocationHostApi.getLocation', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as LocationData?)!;
    }
  }

  Future<bool> setLocationSettings(LocationSettings arg_settings) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.LocationHostApi.setLocationSettings', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_settings]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as bool?)!;
    }
  }
}
