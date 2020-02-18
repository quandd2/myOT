<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listOT.aspx.cs" Inherits="MyOT.listOT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link rel="stylesheet" href="css/bootstrap.min.css">
   <link rel="stylesheet" href="css/datatables.css">
<style>
.table-striped tbody tr:nth-child(odd) td,
.table-striped tbody tr:nth-child(odd) th {
	background-color: #DFF0D8;
} 
h1 {
  font-size: 20px;
  line-height: 0.8em; } 
button:focus,
input:focus,
textarea:focus,
select:focus {
  outline: none; }

.tabs {
  display: block;
  display: -webkit-flex;
  display: -moz-flex;
  display: flex;
  -webkit-flex-wrap: wrap;
  -moz-flex-wrap: wrap;
  flex-wrap: wrap;
  margin: 0;
  overflow: hidden; }
  .tabs [class^="tab"] label,
  .tabs [class*=" tab"] label { 
    cursor: pointer;
    display: block;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1em;
    padding: 2rem 0;
    text-align: center; }
  .tabs [class^="tab"] [type="radio"],
  .tabs [class*=" tab"] [type="radio"] {
    border-bottom: 1px solid rgba(239, 237, 239, 0.5);
    cursor: pointer;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    display: block;
    width: 100%;
    -webkit-transition: all 0.3s ease-in-out;
    -moz-transition: all 0.3s ease-in-out;
    -o-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out; }
    .tabs [class^="tab"] [type="radio"]:hover, .tabs [class^="tab"] [type="radio"]:focus,
    .tabs [class*=" tab"] [type="radio"]:hover,
    .tabs [class*=" tab"] [type="radio"]:focus {
      border-bottom: 1px solid #fd264f; }
    .tabs [class^="tab"] [type="radio"]:checked,
    .tabs [class*=" tab"] [type="radio"]:checked {
      border-bottom: 2px solid #fd264f; }
    .tabs [class^="tab"] [type="radio"]:checked + div,
    .tabs [class*=" tab"] [type="radio"]:checked + div {
      opacity: 1; }
    .tabs [class^="tab"] [type="radio"] + div,
    .tabs [class*=" tab"] [type="radio"] + div {
      display: block;
      opacity: 0;
      padding: 2rem 0;
      width: 90%;
      -webkit-transition: all 0.3s ease-in-out;
      -moz-transition: all 0.3s ease-in-out;
      -o-transition: all 0.3s ease-in-out;
      transition: all 0.3s ease-in-out; }
  .tabs .tab-2 {
    width: 50%; }
    .tabs .tab-2 [type="radio"] + div {
      width: 200%;
      margin-left: 200%; }
    .tabs .tab-2 [type="radio"]:checked + div {
      margin-left: 0; }
    .tabs .tab-2:last-child [type="radio"] + div {
      margin-left: 100%; }
    .tabs .tab-2:last-child [type="radio"]:checked + div {
      margin-left: -100%; }
    #titleds{
            font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
            color: #212529;
                font-size: 3.5rem;
    font-weight: 400;
    line-height: 1.2;
    text-align:center
    }
</style>
</head>
<body style="background:#eee"> 
    <form id="form1" runat="server">  
<h1 id="titleds">
    DANH SÁCH ĐÃ KHAI BÁO <%=Alias.ToUpper() %>
</h1>

<div class="tabs">
  <div class="tab-2">
    <label for="tab2-1">OT BAU dưới 10% (< <%= HourOver10Percent %> giờ)</label>
    <input id="tab2-1" name="tabs-two" type="radio" checked="checked">
    <div style="background:#fff"> 
     <div id="wrap">
			<div class="container"> 
				<table cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
					<thead>
						<tr>
							<th>STT</th>
							<th>MÃ NV</th>
							<th>HỌ VÀ TÊN</th>
							<th>NGÀY THÁNG</th>
							<th>NỘI DUNG CÔNG VIỆC</th>
                            <th>TỪ GIỜ</th>
							<th>ĐẾN GIỜ</th>
							<th>SỐ GIỜ</th>
							<th>ĐỊA ĐIỂM</th>
						</tr>
					</thead>
					<tbody>
						  <asp:Repeater runat="server" ID="rptOTListDown">
                              <ItemTemplate> 
						<tr class="gradeU">
							<td>1</td>
							<td><%# Server.HtmlEncode(Eval("StaffID").ToString()) %></td>
							<td><%# Server.HtmlEncode(Eval("FullName").ToString()) %></td>
							<td class="center"><%# Server.HtmlEncode(Eval("Date").ToString()) %></td>
							<td class="center"> <%# Server.HtmlEncode(Eval("AdditionalNote").ToString()) %></td>
                            <td><%# Server.HtmlEncode(Eval("StartTime").ToString()) %></td>
							<td class="center"><%# Server.HtmlEncode(Eval("EndTime").ToString()) %>
</td>
							<td class="center"> <%# Server.HtmlEncode(Eval("Hours").ToString()) %>
</td>
                            <td class="center"> <%# Server.HtmlEncode(Eval("Address").ToString()) %>

</td>
						</tr> 
                                  </ItemTemplate>
						  </asp:Repeater>
					</tbody> 
				</table>
			</div>
		</div>
    </div>
  </div>
  <div class="tab-2">
    <label for="tab2-2">OT BAU trên 10% (>= <%= HourOver10Percent %> giờ)</label>
    <input id="tab2-2" name="tabs-two" type="radio">
    <div style="background:#fff"> 
     <div id="wrap">
			<div class="container"> 
				<table cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
					<thead>
						<tr>
							<th>STT</th>
							<th>MÃ NV</th>
							<th>HỌ VÀ TÊN</th>
							<th>NGÀY THÁNG</th>
							<th>NỘI DUNG CÔNG VIỆC</th>
                            <th>TỪ GIỜ</th>
							<th>ĐẾN GIỜ</th>
							<th>SỐ GIỜ</th>
							<th>ĐỊA ĐIỂM</th>
						</tr>
					</thead>
					<tbody> 
						<asp:Repeater runat="server" ID="rptOTListUp">
                              <ItemTemplate> 
						<tr class="gradeU">
							<td>1</td>
							<td><%# Server.HtmlEncode(Eval("StaffID").ToString()) %></td>
							<td><%# Server.HtmlEncode(Eval("FullName").ToString()) %></td>
							<td class="center"><%# Server.HtmlEncode(Eval("Date").ToString()) %></td>
							<td class="center"> <%# Server.HtmlEncode(Eval("AdditionalNote").ToString()) %></td>
                            <td><%# Server.HtmlEncode(Eval("StartTime").ToString()) %></td>
							<td class="center"><%# Server.HtmlEncode(Eval("EndTime").ToString()) %>
</td>
							<td class="center"> <%# Server.HtmlEncode(Eval("Hours").ToString()) %>
</td>
                            <td class="center"> <%# Server.HtmlEncode(Eval("Address").ToString()) %>

</td>
						</tr> 
                                  </ItemTemplate>
						  </asp:Repeater>
					</tbody> 
				</table>
			</div>
		</div>
    </div>
  </div>
</div> 
		<script src="js/jquery-2.1.4.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/datatables.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			$('.datatable').dataTable({
				"sPaginationType": "bs_four_button"
			});	
			$('.datatable').each(function(){
				var datatable = $(this);
				// SEARCH - Add the placeholder for Search and Turn this into in-line form control
				var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
				search_input.attr('placeholder', 'Search');
				search_input.addClass('form-control input-sm');
				// LENGTH - Inline-Form control
				var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
				length_sel.addClass('form-control input-sm');
			});
		});
		</script>
    </form>
</body>
</html>
