<?php

namespace App\Http\Controllers\Accounting;

use App\Http\Controllers\Controller;
use App\Incomestatement;
use App\Incomestatement_detail;
use App\TrialBalance;
use App\TrialBalanceDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use DataTables;
use PDF;
use Illuminate\Support\Facades\Auth;

class IncomeStatementController extends Controller
{

    public function incomestatementdata(Request $request)
    {
        if ($request->ajax()) {
            $data = Incomestatement::latest()->get();

            return Datatables::of($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){
                        $btn='';
                        if(Auth::user()->can('isAccounting')){
                            // $btn = ' <a href="' .route('accounting.incomestatement.edit', $row->id). '" class=" btn btn-primary btn-sm my-1">Edit</a>';
                            // $btn .= '<a href="javascript:void(0)" class=" btn btn-primary btn-sm my-1">View</a>';
                            $btn .= ' <a href="javascript:void(0)" id="delete" onClick="removeItem(' .$row->id. ')" class=" btn btn-danger btn-sm my-1">Delete</a>';
                        }
                        $btn .= ' <a href="' .route('accounting.incomestatement.report', $row->id). '" class=" btn btn-info btn-sm my-1">View</a>';
                        return $btn;
                    })
                    ->rawColumns(['details','action'])
                    ->make(true);
        }

    }

    public function index()
    {
        $incomestatements = Incomestatement::all();
        // dd($incomestatements);
        return view('accounting.incomestatement.index');
    }

    public function create()
    {
        $trial_balances = TrialBalance::all();
        return view('accounting.incomestatement.create', compact('trial_balances'));
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $trial_balance =  $pengeluaran = TrialBalanceDetail::where('trial_balance_id', $request->trial_balance_id)
                ->join('accounts', function($join) {
                    $join->on('trial_balance_detail.account_id', '=', 'accounts.id')
                    ->where('accounts.code', '>', 4000);
                })
                ->get();

            $date = date('Y-m-d',strtotime($request->register));

            $income_table = Incomestatement::create([
                'title' => $request->title,
                'register' => $date
            ]);
            $pengeluaran = DB::table('trial_balance_detail')
                ->where('trial_balance_id', $request->trial_balance_id)
                ->join('accounts', function($join) {
                    $join->on('trial_balance_detail.account_id', '=', 'accounts.id')
                     ->where('accounts.code', '=', 4000);
                })
                ->first();

            $income_table_detail = [];
            // expense
            foreach ($trial_balance as $index => $value) {
                $income_table_detail[$index]= [
                    'incomestatement_id' => $income_table->id,
                    'name' => $value->name,
                    'expense' => $value->amount,
                    'account_id' =>$value->account_id,
                    'amount' => 0,
                    'type' => 'income'
                ];
            }

            // pendapatan
            $income_table_detail[]= [
                'incomestatement_id' => $income_table->id,
                'name' => $pengeluaran->name,
                'amount' => $pengeluaran->amount,
                'account_id' =>$pengeluaran->account_id,
                'expense' => 0,
                'type' => 'expense'
            ];
            $pendapatan = [
                "Potongan Penjualan Pasir Super",
                "Potongan Penjualan Pasir Cor",
                "Potongan Penjualan Batu",
                "Biaya Angkut Penjualan",
            ];

            foreach ($pendapatan as $index => $value) {
                $income_table_detail[]= [
                    'incomestatement_id' => $income_table->id,
                    'name' => $value,
                    'amount' => $request->amount[$index],
                    'account_id' => null,
                    'expense' => 0,
                    'type' => 'income',
                ];
            }

            // dd($income_table_detail);
            // $income_detail = Incomestatement_detail::create($income_table_detail);
            $income_table->incomestatement_detail()->createMany($income_table_detail);
            DB::commit();
            return redirect()->back()->with('success', 'Success');
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);
            return redirect()->back();
        }

    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy(Incomestatement $incomestatement)
    {
        try {
            $incomestatement->delete();
            return 'Item Berhasil Di Hapus';
        } catch (\Throwable $th) {
            return $th;
        }

    }

    public function report($id)
    {

        $total = Incomestatement::selectRaw('sum(incomestatement_detail.amount) as amount_total, sum(incomestatement_detail.expense) as expense_total')
        ->join('incomestatement_detail', 'incomestatement.id', '=', 'incomestatement_detail.incomestatement_id')
        ->first();

        $incomestatement = Incomestatement::findOrFail($id);

        $pdf = PDF::loadview('accounting.incomestatement.report', ['incomestatement' => $incomestatement, 'total' => $total ]);
        return $pdf->stream();

    }
}