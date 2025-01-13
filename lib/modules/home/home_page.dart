import 'package:craftd_widget/presentation/builder/craftd_builder_manager.dart';
import 'package:craftd_widget/presentation/ui/craftd_dynamic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdui_craftd_getx/custom/craftd/custom_botao_fv/custom_craft_button_builder.dart';
import 'package:sdui_craftd_getx/custom/craftd/main_state.dart';
import 'package:sdui_craftd_getx/custom/craftd/my_component/my_component_builder.dart';
import 'package:sdui_craftd_getx/modules/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    controller.loadProperties(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Obx(() {
          if (controller.state.value is MainLoadingState) {
            return const CircularProgressIndicator();
          } else if (controller.state.value is MainErrorState) {
            return Text((controller.state.value as MainErrorState).msg);
          } else if (controller.state.value is MainSuccessState) {
            final simplePropertiesList = (controller.state.value as MainSuccessState).properties;

            final craftdBuilderManager = CraftDBuilderManager().add(
              [
                MyComponentBuilder(),
                CustomCraftButtonBuilder(),
              ],
            );

            return CraftDynamic(
              simplePropertiesList: simplePropertiesList,
              craftDBuilderManager: craftdBuilderManager,
              onAction: (actionProperties) {
                print(
                  "categoria ${actionProperties.analyticsProperties?.category} "
                  "label ${actionProperties.analyticsProperties?.label} - "
                  "track ${actionProperties.analyticsProperties?.track}",
                );
                print("action ${actionProperties.analyticsProperties?.action}");
              },
            );
          }
          return Container();
        }),
      ),
    );
  }
}

// import 'package:craftd_widget/presentation/builder/craftd_builder_manager.dart';
// import 'package:craftd_widget/presentation/ui/craftd_dynamic.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sdui_craftd_getx/example/main_controller.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:sdui_craftd_getx/example/custom_botao_fv/custom_botao_fv_builder.dart';
// // import 'package:sdui_craftd_getx/example/main_controller.dart';
// import 'package:sdui_craftd_getx/example/main_state.dart';
// import 'package:sdui_craftd_getx/example/my_component/my_component_builder.dart';

// class HomePage extends GetView<MainController> {
//   const HomePage({super.key, required this.title});

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     controller.loadProperties(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Obx(() {
//           if (controller.state is MainLoadingState) {
//             return const CircularProgressIndicator();
//           } else if (controller.state is MainErrorState) {
//             return Text((controller.state as MainErrorState).msg);
//           } else if (controller.state is MainSuccessState) {
//             final simplePropertiesList = (controller.state as MainSuccessState).properties;

//             final craftdBuilderManager = CraftDBuilderManager().add(
//               [
//                 MyComponentBuilder(),
//                 CustomCraftButtonBuilder(),
//               ],
//             );

//             return CraftDynamic(
//               simplePropertiesList: simplePropertiesList,
//               craftDBuilderManager: craftdBuilderManager,
//               onAction: (actionProperties) {
//                 print(
//                   "categoria ${actionProperties.analyticsProperties?.category} "
//                   "label ${actionProperties.analyticsProperties?.label} - "
//                   "track ${actionProperties.analyticsProperties?.track}",
//                 );
//               },
//             );
//           }
//           return Container();
//         }),
//       ),
//     );
//   }
// }

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key, required this.title});

// //   final String title;

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   late MainController _controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = MainController();
// //     _controller.loadProperties(context);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text(widget.title),
// //         ),
// //         body: Center(
// //           child: Observer(builder: (_) {/* Aqui e um Observer porque esta usando Mobx no caso vamos usar Getx que e o tenho mais conhecimento */
// //             switch (_controller.state.runtimeType) {
// //               case MainLoadingState:
// //                 return const CircularProgressIndicator();
// //               case MainErrorState:
// //                 return Text(_controller.state.toStateError().msg);
// //               case MainSuccessState:
// //                 final simplePropertiesList =
// //                     _controller.state.toStateSuccess().properties;

// //                 /*--------------------------------------------------*/
// //                 // Esse e o responsavel por fazer funcionar todo o mecanismo do CraftD;
// //                 // Você pode colocá -lo em sua injeção de dependência ou passar via 
// //                 // parametro, para ficar mais estruturado;
// //                 final craftdBuilderManager = CraftDBuilderManager().add(
// //                   [
// //                     MyComponentBuilder(), 
// //                     CustomCraftButtonBuilder(),
// //                   ]/* Aqui vai o Builder do seu componente, a principio da para ser mais de um*/
// //                 );
// //                 /*--------------------------------------------------*/
// //                 return CraftDynamic(
// //                   /* 
// //                     * Pelo que entendi basicamente esse e um componente que renderiza na tela todos componentes compilados;
// //                     * Esse componente pode ser usado em uma tela junto com outros componentes normais
// //                     * Caso queira da para criar o seu proprio CraftDynamic disse o criador do CraftD 
// //                   */
// //                   simplePropertiesList: simplePropertiesList,/* Lista de partes do json que foram mapeadas para propriedades no caso properties, isso e feito no controller */
// //                   craftDBuilderManager : craftdBuilderManager, /* Retorna uma acao para trabalhar em cima dos cliques do botao por exemplo. */
// //                   onAction: (actionProperties) {
// //                     print(
// //                         "categoria ${actionProperties.analyticsProperties?.category} "
// //                         "label ${actionProperties.analyticsProperties?.label} - "
// //                         "track ${actionProperties.analyticsProperties?.track}");
// //                   },
// //                 );
// //               //break;
// //             }
// //             return Container();
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }