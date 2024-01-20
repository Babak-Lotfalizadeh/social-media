class BottomNavigationEvent {}

class BottomNavigationChangeValue extends BottomNavigationEvent {
  final int newValue;
  BottomNavigationChangeValue({required this.newValue});
}