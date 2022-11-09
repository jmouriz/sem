enum Operator {
  start,
  contain
}

class SearchCondition {
  String name;
  Operator operator;
  String? value;

  SearchCondition({
    required this.name,
    this.operator = Operator.start,
    this.value,
  });
}
