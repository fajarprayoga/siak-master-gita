<!DOCTYPE html>
<html>
<head>
	<title>Report Transaksi </title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<style type="text/css">
		table tr td,
		table tr th{
			font-size: 7pt;
		}
	</style>
	<div style="text-align : center">
		<h5>Laporan Transaksi </h4>
		<h6><a target="_blank" href="{{ url('/') }}">Laporan Keuangan </a></h5>
	</div>
    <div style="text-align: right" >
        {{date('d M     Y', strtotime($date))}}
    </div>
	<table class='table table-bordered'>
		<thead>
			<tr>
				<th>No</th>
				<th>@lang('global.transaction.vehicle_number')</th>
                <th>@lang('global.transaction.vehicle')</th>
                <th>@lang('global.transaction.type_material')</th>
                <th>@lang('global.transaction.price_material')</th>
                <th>@lang('global.transaction.expense')</th>
                <th>@lang('global.transaction.nomor')</th>
			</tr>
		</thead>
		<tbody style="font-size: 7pt">
            <?php $next = 0 ?>
            @foreach ($transactions as $index=> $transaction)
                <?php $next+=1 ?>
                <tr>
                    <td>
                        {{$index + 1}}
                    </td>
                    <td> {{$transaction->vehicle_number}} </td>
                    <td> {{$transaction->vehicle}} </td>
                    <td> {{$transaction->material->name}} </td>
                    <td> {{Rupiah($transaction->price_material)}} </td>
                    <td>  </td>
                    <td> {{$transaction->nomor}} </td>
                </tr>
            @endforeach
            <tr>
                <td>
                    {{$next+=1}}
                </td>
                <td> Gosek</td>
                <td>  </td>
                <td>  </td>
                <td>  </td>
                <td> {{Rupiah($gosek)}} </td>
                <td>  </td>
            </tr>
            @foreach ($transactions_expense as $index=> $transaction)
            <tr>
                <td>
                    {{$next+=1}}
                </td>
                <td> {{$transaction->vehicle_number}} </td>
                <td> {{$transaction->vehicle}} </td>
                <td>  </td>
                <td>  </td>
                <td> {{Rupiah($transaction->expense)}} </td>
                <td> {{$transaction->nomor}} </td>
            </tr>
        @endforeach
        <tr style="text-align: center; background-color: #B6B6B4; font-weight: bold; color: white; font-size: 30px">
            <td  colspan="4" >Total</td>
            <td>{{Rupiah($total)}}</td>
            <td>{{Rupiah($total_expense)}}</td>
            <td></td>
        </tr>
        <tr style="text-align: center; background-color: #728FCE; font-weight: bold; color: white; font-size: 30px">
            <td  colspan="4" >Saldo</td>
            <td colspan="2" >{{Rupiah ($total - $total_expense)}}</td>
            <td></td>
        </tr>
		</tbody>
	</table>

</body>
</html>
