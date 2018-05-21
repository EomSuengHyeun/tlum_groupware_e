<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>
	<style>
		.mainLabel{
		    width: 200px;
		    float: left;
		}
		.mainfullcalendar{
			width: 500px;	
		    float: left;
		}
		#mainCalendar{
			width: 40%;
			float:left;
			padding:30px 0 15px 30px;
		}
		#mainTable{
			width: 60%;
			float: left;
			padding:30px 15px 0 30px;
		}
		#contentMenu{
			display: none;
		}
		#fastMenu{
			display: none;
		}
		div#reftMenu div.action{
			display: block;
		}
	</style>
	<!-- content -->
	<section class="content">
		<div id="reftMenu">
		<ul class="nav nav-tabs nav-justified">
		  <li id="contentNav" role="presentation"><a href="#">메뉴</a></li>
		  <li id="fastNav" role="presentation" class="active"><a href="#">빠른메뉴</a></li>
		</ul>
			<div id="contentMenu">
				서브메뉴 리스트
			</div>
			<div id="fastMenu">
				빠른메뉴 리스트
			</div>
		</div>	
		<div class="aside">
			
			<!-- cal -->
			<div id="mainCalendar">
				<div class="mainLabel">
		          <div class="box box-solid">
		            <div class="box-header with-border">
		              <h4 class="box-title">Draggable Events</h4>
		            </div>
		            <div class="box-body">
		              <!-- the events -->
		              <div id="external-events">
		                <div class="external-event bg-green">Lunch</div>
		                <div class="external-event bg-yellow">Go home</div>
		                <div class="external-event bg-aqua">Do homework</div>
		                <div class="external-event bg-light-blue">Work on UI design</div>
		                <div class="external-event bg-red">Sleep tight</div>
		                <div class="checkbox">
		                  <label for="drop-remove">
		                    <input type="checkbox" id="drop-remove">
		                    remove after drop
		                  </label>
		                </div>
		              </div>
		            </div>
		            <!-- /.box-body -->
		          </div>
		          <!-- /. box -->
		        </div>
		        <!-- /.col -->
		        <div class="mainfullCalendar">
		          <div class="box box-primary">
		            <div class="box-body no-padding">
		              <!-- THE CALENDAR -->
		              <div id="calendar"></div>
		            </div>
		            <!-- /.box-body -->
		          </div>
		          <!-- /. box -->
		        </div>
				
			</div>
	        
			<!-- cal -->
			<div id="mainTable">
				<table class="table table-striped table-hover">
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>2</td>
						<td>2</td>
					</tr>
					<tr>
						<td>3</td>
						<td>3</td>
						<td>3</td>
					</tr>
					<tr>
						<td>4</td>
						<td>4</td>
						<td>4</td>
					</tr>
				</table>
				<!-- 리스트 버튼 -->
			<div style="margin: auto" class="btn-group" role="group">
			  <button type="button" class="btn btn-default"> &lt&lt</button>
			  <button type="button" class="btn btn-primary">1</button>
			  <button type="button" class="btn btn-success">2</button>
			  <button type="button" class="btn btn-info">3</button>
			  <button type="button" class="btn btn-warning">5</button>
			  <button type="button" class="btn btn-danger">6</button>
			  <button type="button" class="btn btn-default">7</button>
			  <button type="button" class="btn btn-default">8</button>
			  <button type="button" class="btn btn-default">9</button>
			  <button type="button" class="btn btn-default"> &gt&gt </button>
			</div>
			</div>
		</div>
	</section>
	<!--END content -->
<!-- jQuery 3 -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/moment.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/fullcalendar.js"></script>


<script type="text/javascript">

$(function () {
	/* 서브메뉴, 메인메뉴 보여주기*/
	menuAction();
	
	
/*  달력 스크립트 시작*/
    /* initialize the external events
     -----------------------------------------------------------------*/
    function init_events(ele) {
      ele.each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        })

      })
    }

    init_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()
    $('#calendar').fullCalendar({
      header    : {
        left  : 'prev,next today',
        center: 'title',
        right : 'month,agendaWeek,agendaDay'
      },
      buttonText: {
        today: 'today',
        month: 'month',
        week : 'week',
        day  : 'day'
      },
      //Random default events
      events    : [
        {
          title          : 'All Day Event',
          start          : new Date(y, m, 1),
          backgroundColor: '#f56954', //red
          borderColor    : '#f56954' //red
        },
        {
          title          : 'Long Event',
          start          : new Date(y, m, d - 5),
          end            : new Date(y, m, d - 2),
          backgroundColor: '#f39c12', //yellow
          borderColor    : '#f39c12' //yellow
        },
        {
          title          : 'Meeting',
          start          : new Date(y, m, d, 10, 30),
          allDay         : false,
          backgroundColor: '#0073b7', //Blue
          borderColor    : '#0073b7' //Blue
        },
        {
          title          : 'Lunch',
          start          : new Date(y, m, d, 12, 0),
          end            : new Date(y, m, d, 14, 0),
          allDay         : false,
          backgroundColor: '#00c0ef', //Info (aqua)
          borderColor    : '#00c0ef' //Info (aqua)
        },
        {
          title          : 'Birthday Party',
          start          : new Date(y, m, d + 1, 19, 0),
          end            : new Date(y, m, d + 1, 22, 30),
          allDay         : false,
          backgroundColor: '#00a65a', //Success (green)
          borderColor    : '#00a65a' //Success (green)
        },
        {
          title          : 'Click for Google',
          start          : new Date(y, m, 28),
          end            : new Date(y, m, 29),
          url            : 'http://google.com/',
          backgroundColor: '#3c8dbc', //Primary (light-blue)
          borderColor    : '#3c8dbc' //Primary (light-blue)
        }
      ],
      editable  : true,
      droppable : true, // this allows things to be dropped onto the calendar !!!
      drop      : function (date, allDay) { // this function is called when something is dropped

        // retrieve the dropped element's stored Event Object
        var originalEventObject = $(this).data('eventObject')

        // we need to copy it, so that multiple events don't have a reference to the same object
        var copiedEventObject = $.extend({}, originalEventObject)

        // assign it the date that was reported
        copiedEventObject.start           = date
        copiedEventObject.allDay          = allDay
        copiedEventObject.backgroundColor = $(this).css('background-color')
        copiedEventObject.borderColor     = $(this).css('border-color')

        // render the event on the calendar
        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true)

        // is the "remove after drop" checkbox checked?
        if ($('#drop-remove').is(':checked')) {
          // if so, remove the element from the "Draggable Events" list
          $(this).remove()
        }

      }
    })

    /* ADDING EVENTS */
    var currColor = '#3c8dbc' //Red by default
    //Color chooser button
    var colorChooser = $('#color-chooser-btn')
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      //Save color
      currColor = $(this).css('color')
      //Add color effect to button
      $('#add-new-event').css({ 'background-color': currColor, 'border-color': currColor })
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      //Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

      //Create events
      var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.html(val)
      $('#external-events').prepend(event)

      //Add draggable funtionality
      init_events(event)

      //Remove event from text input
      $('#new-event').val('')
    })
  })

/*  달력 스크립트 끝*/

/* 탭 스크립트  */


	$("#reftMenu > ul > li").click(function(){
		$("#reftMenu > ul > li").removeClass("active");
		$(this).addClass("active");
		menuAction();
	});
	
	function menuAction(){
		if($("#contentNav").attr("class")=="active"){
			$("#contentMenu").addClass("action");
			$("#fastMenu").removeClass("action");
		}else if($("#fastNav").attr("class")=="active"){
			$("#contentMenu").removeClass("action");
			$("#fastMenu").addClass("action");
		}
	};
	
</script>
