class AnoArg {
  final String name;

  final List<String> arg;

  final List<List<String>> options;

  AnoArg({
    required this.name,
    required this.arg,
    required this.options,
  });
}

final ano1 = AnoArg(name: " leaf spots", arg: [
  "color",
  "size",
  "conditions"
], options: [
  ["dark margins and gray or tan centers", "Brown to Black", "Yellow"],
  ["Big", "Small"],
  ["humid and wet", "warm"]
]);
final ano2 = AnoArg(name: " leaf blights", arg: [
  "Color",
  "Size",
  "Conditions"
], options: [
  ["dark margins and gray or tan centers", "Brown to Black"],
  ["Big", "Small"],
  ["humid and wet", "warm", "dry and hot"]
]);
final ano3 = AnoArg(
  name: " powdery mildew",
  arg: [],
  options: [
    [""],
    [""],
    [""]
  ],
);
final ano4 = AnoArg(name: " rust", arg: [
  "color",
  "size",
  "conditions"
], options: [
  ["Orange to Brown", "Brown to Black"],
  ["Big", "Small"],
  ["humid", "dry"]
]);

final List<AnoArg> anoarg = [ano1, ano2, ano3, ano4];
