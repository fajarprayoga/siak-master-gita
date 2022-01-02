<?php

namespace App\Http\Controllers\accounting;

use App\Account;
use App\Http\Controllers\Controller;
use App\Ledger;
use App\TrialBalance;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Date;
use DataTables;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PDF;
class TrialBalanceController extends Controller
{
    public function trialbalancedata (Request $request){
        if ($request->ajax()) {
            $data = TrialBalance::latest()->get();

            return Datatables::of($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){
                        $btn='';
                        $btn .= ' <a href="' .route('accounting.trialbalance.report', $row->id). '" class=" btn btn-info btn-sm my-1">View</a>';
                        if(Auth::user()->can('isAccounting')){
                            // $btn = ' <a href="' .route('accounting.ledger.edit', $row->id). '" class=" btn btn-primary btn-sm my-1">Edit</a>';
                            // $btn .= '<a href="javascript:void(0)" class=" btn btn-primary btn-sm my-1">View</a>';
                            $btn .= ' <a href="javascript:void(0)" id="delete" onClick="removeItem(' .$row->id. ')" class=" btn btn-danger btn-sm my-1">Delete</a>';
                        }
                        return $btn;
                    })
                    ->rawColumns(['details','action'])
                    ->make(true);
        }
    }

    public function index()
    {
        // $trial_balances = TrialBalance::with('trial_balance_detail')->get();

        return view('accounting.trialbalance.index');
    }

   function create()
    {
        $ledgers = Ledger::all();
        // dd($ledgers);
        return view('accounting.trialbalance.create', compact('ledgers'));
    }


    public function store(Request $request)
    {
        DB::beginTransaction();

        try {
            // $request->register =  (new DateTime($request->register))->format('Y-m-d');
            $data = $request->all();
            $data['register'] = (new DateTime($request->register))->format('Y-m-d');

            $trial_balance = TrialBalance::create($data);
            $ledger = Ledger::with('ledger_detail')->where('id', $request->ledger_id)->first();

            // dd($ledger->ledger_detail->groupBy('account_id'));
            $trial_balance_detail = [];
            $data_trial_balance = [];
            foreach ($ledger->ledger_detail->groupBy('account_id') as $index => $detail) {
                $sum = 0;
                foreach ($detail as $indexAccount => $account) {
                    $sum = $account->types == 'debit' ? $sum + $account->amount :  $sum - $account->amount;
                }
                $data_trial_balance[$index] = [
                    'date' => (new DateTime($trial_balance->register))->format('Y-m-d'),
                    'account_id' => $detail[0]->account->id,
                    // 'types' => $detail[0]->types,
                    'amount' => $sum,
                    // 'description' => $detail->description
                ];
            }

            $account = Account::all();

            foreach ($account as $key => $value) {
                $trial_balance_detail[$key] = [
                    'date' => (new DateTime($trial_balance->register))->format('Y-m-d'),
                    'account_id' => $value->id,
                    'amount' => array_key_exists($value->id,$data_trial_balance)? $data_trial_balance[$value->id]['amount'] : 0 ,
                ];
            }

            $trial_balance->trial_balance_detail()->createMany($trial_balance_detail);

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


    public function destroy($id)
    {
        try {
            $trial_balance = TrialBalance::findOrFail($id);
            $trial_balance->delete();
            return 'Item Berhasil Di Hapus';
        } catch (\Throwable $th) {
            return $th;
        }
    }

    public function report($id)
    {

        $trial_balance = TrialBalance::where('id', $id)
        ->with(['trial_balance_detail' => function($query) {
            $query->with('account');
            $query->orderBy('date', 'ASC');
        }])->first();

        // $trial_balanceDetail = trial_balanceDetail::where('trial_balance_id', $trial_balance->id)->with('account')->get();
        // $accountId = $trial_balanceDetail->groupBy('account_id');
        // dd($trial_balance->trial_balance_detail);
        $pdf = PDF::loadview('accounting.trialbalance.report', ['trial_balance' => $trial_balance]);
        return $pdf->stream();
    }

}
