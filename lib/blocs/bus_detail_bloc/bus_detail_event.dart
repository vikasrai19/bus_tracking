abstract class BusDetailsEvent {}

class GetBusDetails extends BusDetailsEvent {
  final String? collegeBusId;

  GetBusDetails({this.collegeBusId});
}
