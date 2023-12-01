import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shapefile/model.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'chat_isar_repo.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GlobalKey<_MapScreenState> bottomSheetKey = GlobalKey<_MapScreenState>();
  late List<IndianStates> _indianStatesList;

  late MapShapeSource _mapSource;
  late List<MapColorMapper> _colorMappers;

  bool autoHide = true;
  bool inited = false;

  @override
  void initState() {
    _indianStatesList = indianStatesList;
    _colorMappers = <MapColorMapper>[
      const MapColorMapper(value: '0', color: Colors.grey),
      const MapColorMapper(value: '1', color: Colors.yellow),
      const MapColorMapper(value: '2', color: Colors.green),
      const MapColorMapper(value: '3', color: Colors.blue),
      const MapColorMapper(value: '4', color: Colors.red)
    ];
    update();

    init();

    super.initState();
  }

  void updateSarvayCount(int index, int newCount) {
    setState(() {
      _indianStatesList[index].sarvayCount = newCount.toString();
      update();
    });
  }

  @override
  void dispose() {
    _indianStatesList.clear();
    _colorMappers.clear();
    super.dispose();
  }

  bool isLoding = false;
  void init() async {
    try {
      setState(() => isLoding = false);
      final localResponse = await IsarRepo.instance.fetchStates();

      if (localResponse != null) {
        _indianStatesList = localResponse;
      }
    } catch (e) {
      return log(e.toString());
    } finally {
      setState(() => isLoding = false);
      update();
    }
  }

  void update() {
    _mapSource = MapShapeSource.asset('assets/india.json',
        shapeDataField: 'name',
        dataCount: _indianStatesList.length,
        primaryValueMapper: (int index) => _indianStatesList[index].state,
        shapeColorValueMapper: (int index) =>
            _indianStatesList[index].sarvayCount,
        shapeColorMappers: _colorMappers);
  }

  Widget _buildCustomTooltipWidget(
      IndianStates model, ThemeData themeData, bool isLightTheme) {
    return Container(
      key: bottomSheetKey,
      width: 300,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 5),
                Text(
                  model.state,
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.bodyMedium!.copyWith(
                      color: isLightTheme
                          ? const Color.fromRGBO(0, 0, 0, 0.87)
                          : const Color.fromRGBO(255, 255, 255, 0.87),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(_getTooltipText(model),
                    style: themeData.textTheme.bodySmall!.copyWith(
                      color: isLightTheme
                          ? const Color.fromRGBO(0, 0, 0, 0.87)
                          : const Color.fromRGBO(255, 255, 255, 0.87),
                    )),
              ],
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }

  IndianStates _getSelectedIndexModel(int index) {
    return _indianStatesList[index];
  }

  String _getTooltipText(IndianStates model) {
    return 'survey count of state ${model.state} is ${model.sarvayCount} ';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final bool scrollEnabled = constraints.maxHeight > 400;
      double height = scrollEnabled ? constraints.maxHeight : 400;
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        final double refHeight = height * 0.6;
        height = height > 500 ? (refHeight < 500 ? 500 : refHeight) : height;
      }

      return Scaffold(
        appBar: AppBar(
          title: const Text("Map of india"),
          centerTitle: true,
          leading: isLoding
              ? const CircularProgressIndicator()
              : IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      context: context,
                      builder: (context) => BottomSheetContent(
                        indianStatesList: _indianStatesList,
                        updateSarvayCount: updateSarvayCount,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.list_alt_outlined,
                  ),
                ),
        ),
        body: Center(
          child: isLoding
              ? const CircularProgressIndicator()
              : InteractiveViewer(
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: height,
                    child: _buildMapsWidget(themeData, scrollEnabled),
                  ),
                ),
        ),
      );
    });
  }

  Widget _buildMapsWidget(ThemeData themeData, bool scrollEnabled) {
    final bool isLightTheme =
        themeData.colorScheme.brightness == Brightness.light;
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: inited
              ? null
              : () => setState(() {
                    inited = true;
                    update();
                    log("message");
                  }),
          child: Container(
            color: Colors.white,
            padding: scrollEnabled
                ? EdgeInsets.only(
                    left: 15,
                    top: MediaQuery.of(context).size.height * 0.05,
                    bottom: MediaQuery.of(context).size.height * 0.075)
                : const EdgeInsets.only(bottom: 70.0),
            child: SfMaps(
              layers: <MapLayer>[
                MapShapeLayer(
                  showDataLabels: true,
                  legend: const MapLegend(MapElement.shape,
                      position: MapLegendPosition.bottom,
                      iconType: MapIconType.circle),
                  loadingBuilder: (BuildContext context) {
                    return const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    );
                  },
                  source: _mapSource,
                  shapeTooltipBuilder: (BuildContext context, int index) {
                    return _buildCustomTooltipWidget(
                        _getSelectedIndexModel(index), themeData, isLightTheme);
                  },
                  strokeColor: isLightTheme
                      ? const Color.fromRGBO(255, 255, 255, 1)
                      : const Color.fromRGBO(49, 49, 49, 1),
                  strokeWidth: 0.5,
                  tooltipSettings: MapTooltipSettings(
                    color: isLightTheme
                        ? const Color.fromRGBO(255, 255, 255, 1)
                        : const Color.fromRGBO(66, 66, 66, 1),
                    strokeColor: const Color.fromRGBO(153, 153, 153, 1),
                    strokeWidth: 0.5,
                    hideDelay: autoHide ? 3.0 : double.infinity,
                  ),
                  dataLabelSettings: MapDataLabelSettings(
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 9, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  final List<IndianStates> indianStatesList;
  final void Function(int index, int newCount) updateSarvayCount;

  const BottomSheetContent({
    Key? key,
    required this.indianStatesList,
    required this.updateSarvayCount,
  }) : super(key: key);

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: widget.indianStatesList.length,
        itemBuilder: (context, index) => ListTile(
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  int currentCount =
                      int.parse(widget.indianStatesList[index].sarvayCount);
                  int newCount = (currentCount - 1) % 5;
                  IsarRepo.instance.updateSarvayCount(
                      widget.indianStatesList[index].state, "$newCount");
                  widget.updateSarvayCount(index, newCount);

                  setState(() {});
                },
              ),
              Text(widget.indianStatesList[index].sarvayCount),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  int currentCount =
                      int.parse(widget.indianStatesList[index].sarvayCount);
                  int newCount = (currentCount + 1) % 5;
                  IsarRepo.instance.updateSarvayCount(
                      widget.indianStatesList[index].state, "$newCount");
                  widget.updateSarvayCount(index, newCount);

                  setState(() {});
                },
              )
            ],
          ),
          title: Text(widget.indianStatesList[index].state),
          subtitle: Text(
            "Survey Count : ${widget.indianStatesList[index].sarvayCount}",
          ),
        ),
      ),
    );
  }
}
