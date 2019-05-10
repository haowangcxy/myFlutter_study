import 'package:flutter/material.dart';
import 'package:flutter_app/ThirtyPart/flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_app/ThirtyPart/flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_app/ThirtyPart/flutter_calendar_carousel/classes/event_list.dart';

class CalendarTest extends StatefulWidget {
  @override
  _CalendarTestState createState() => _CalendarTestState();
}



class _CalendarTestState extends State<CalendarTest> {

static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  DateTime _currentDate;

  DateTime _currentDate1 = DateTime(2019, 4, 3);
  DateTime _currentDate2 = DateTime(2019, 4, 4);

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2019, 4, 10): [
        new Event(
          date: new DateTime(2019, 4, 10),
          title: 'Event 1',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2019, 4, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2019, 4, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentDate = DateTime.now();
    
    // _markedDateMap 

    // _markedDateMap.add(
    //     new DateTime(2019, 2, 25),
    //     new Event(
    //       date: new DateTime(2019, 2, 25),
    //       title: 'Event 5',
    //       // icon: _eventIcon,
    //     ));

    // _markedDateMap.add(
    //     new DateTime(2019, 2, 10),
    //     new Event(
    //       date: new DateTime(2019, 2, 10),
    //       title: 'Event 4',
    //       // icon: _eventIcon,
    //     ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('text'),
        ),
        body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: CalendarCarousel<Event>(
                  onDayPressed: (DateTime date, List list) {
                    print('CalendarCarousel' + date.toString());
                    setState(() {
                      _currentDate = date;
                    });
                  },
                  weekendTextStyle: TextStyle(
                    color: Colors.red,
                  ),
                  thisMonthDayBorderColor: Colors.grey,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
                  weekFormat: false,
                  height: 420.0,
                  selectedDateTime: _currentDate,
                  daysHaveCircularBorder: true,
                  // markedDatesMap:_markedDateMap,
                  
                )),
          ),
        ));
  }
}
