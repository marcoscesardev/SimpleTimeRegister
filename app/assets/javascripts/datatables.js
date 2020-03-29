//= require datatables/jquery.dataTables

// optional change '//' --> '//=' to enable

//Global setting and initializer

$.extend( $.fn.dataTable.defaults, {
  responsive: true,
  pagingType: 'full',
  //dom:
  //  "<'row'<'col-sm-4 text-left'f><'right-action col-sm-8 text-right'<'buttons'B> <'select-info'> >>" +
  //  "<'row'<'dttb col-12 px-0'tr>>" +
  //  "<'row'<'col-sm-12 table-footer'lip>>"
});


$(document).on('preInit.dt', function(e, settings) {
  var api, table_id, url;
  api = new $.fn.dataTable.Api(settings);
  table_id = "#" + api.table().node().id;
  url = $(table_id).data('source');
  if (url) {
    return api.ajax.url(url);
  }
});


// init on turbolinks load
$(document).on('turbolinks:load', function() {
  if (!$.fn.DataTable.isDataTable("table[id^=dttb-]")) {
    $("table[id^=dttb-]").DataTable();
  }
});

// turbolinks cache fix
$(document).on('turbolinks:before-cache', function() {
  var dataTable = $($.fn.dataTable.tables(true)).DataTable();
  if (dataTable !== null) {
    dataTable.clear();
    dataTable.destroy();
    return dataTable = null;
  }
});

$(document).ready(function() {
  $('#responsive-table').DataTable({
    "language": {
      "sEmptyTable":   "Não foi encontrado nenhum registo",
      "sLoadingRecords": "A carregar...",
      "sProcessing":   "A processar...",
      "sLengthMenu":   "Mostrar _MENU_ registos",
      "sZeroRecords":  "Não foram encontrados resultados",
      "sInfo":         "Mostrando de _START_ até _END_ de _TOTAL_ registos",
      "sInfoEmpty":    "Mostrando de 0 até 0 de 0 registos",
      "sInfoFiltered": "(filtrado de _MAX_ registos no total)",
      "sInfoPostFix":  "",
      "sSearch":       "Procurar:",
      "sUrl":          "",
      "oPaginate": {
        "sFirst":    "Primeiro",
        "sPrevious": "Anterior",
        "sNext":     "Seguinte",
        "sLast":     "Último"
      },
      "oAria": {
        "sSortAscending":  ": Ordenar colunas de forma ascendente",
        "sSortDescending": ": Ordenar colunas de forma descendente"
      },
      
    },
    "order": []
  });
});