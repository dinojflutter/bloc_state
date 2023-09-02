part of "my_checkbox_import.dart";

class MycheckBox extends StatefulWidget {
  const MycheckBox({super.key});

  @override
  State<MycheckBox> createState() => _MycheckBoxState();
}

class _MycheckBoxState extends State<MycheckBox> {
  MycheckBoxviewmodel mycheckBoxviewmodel = MycheckBoxviewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Check Box"),
      ),
      body: BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
        bloc: mycheckBoxviewmodel.ischeckBox,
        builder: (context, state) {
          return SwitchListTile.adaptive(
              activeColor: Colors.red,
              dragStartBehavior: DragStartBehavior.down,
              title: Text("Dark Mode"),
              value: state.data,
              onChanged: (value) {
                mycheckBoxviewmodel.ischeckBox
                    .onUpdateData(state.data.toggle());
              });
        },
      ),
    );
  }
}
