# dashing.js is located in the dashing framework
# It includes jquery & batman for you.
#= require dashing.js

#= require_directory .
#= require_tree ../../widgets

console.log("Yeah! The dashboard has started!")

Dashing.on 'ready', ->



  test = $(document.createElement('li'))
    .attr('data-row': 1)
    .attr('data-col': 1)
    .attr('data-sizex': 1)
    .attr('data-sizey': 1)
  test.append '<div data-id="valuation" data-title="val" data-moreinfo="b" class="widget widget-number valuation"></div>'
  $('.gridster ul').append test




  Dashing.widget_margins ||= [5, 5]
  Dashing.widget_base_dimensions ||= [300, 360]
  Dashing.numColumns ||= 4

  contentWidth = (Dashing.widget_base_dimensions[0] + Dashing.widget_margins[0] * 2) * Dashing.numColumns

  Batman.setImmediate ->
    $('.gridster').width(contentWidth)
    $('.gridster ul:first').gridster
      widget_margins: Dashing.widget_margins
      widget_base_dimensions: Dashing.widget_base_dimensions
      avoid_overlapped_widgets: !Dashing.customGridsterLayout
      draggable:
        stop: Dashing.showGridsterInstructions
        start: -> Dashing.currentWidgetPositions = Dashing.getWidgetPositions()

Dashing.on 'alert', ->
  test = $(document.createElement('li'))
    .attr('data-row': 1)
    .attr('data-col': 1)
    .attr('data-sizex': 1)
    .attr('data-sizey': 1)
  test.append '<div data-id="buzzwords" data-view="List" data-unordered="true" data-title="Buzzwords" data-moreinfo="# of times said around the office"></div>'
  $('.gridster ul').append test
  console.log("Woot!", $('.gridster ul:first'))