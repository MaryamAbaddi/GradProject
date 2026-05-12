



import 'package:equatable/equatable.dart';

abstract class ConnectivityState extends Equatable{
  const ConnectivityState();
  @override 
  List<Object?> get props => [];
}


class ConnectivityConnected extends ConnectivityState{
  const ConnectivityConnected();
}

class ConnectivityDisconnected extends ConnectivityState{
  const ConnectivityDisconnected();
}