import 'package:flutter/material.dart';

abstract class LocationTrackerNavigation {
  LocationTrackerNavigation._();
  static const id = 0;
  static const locationOverview = '/location-overview';
  static const locationDetail = '/location-detail';
}

abstract class HealthTrackerNavigation {
  HealthTrackerNavigation._();
  static const id = 2;
  static const healthOverview = '/health-overview';
}

abstract class FamilyTreeTrackerNavigation {
  FamilyTreeTrackerNavigation._();
  static const id = 1;
  static const familyTreeOverview = '/family-tree-overview';
}
