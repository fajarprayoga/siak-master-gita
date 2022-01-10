<?php

namespace App\Http\Controllers\Cashier;

use App\Gosek;
use App\Http\Controllers\Controller;
use App\Http\Requests\TransactionRequestCreate;
use Illuminate\Http\Request;
use App\Transaction;
use App\Material;
use function PHPSTORM_META\type;
use DataTables;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PDF;
class TransactionController extends Controller
{

    public $type_expense = ['operator','kasir','helper','jalan 40', 'pemilik','jalan desa', 'lain-lain', 'solar'];
    public function transactiondata(Request $request)
    {
        if ($request->ajax()) {
            // $data = Journal::latest()->get();
            $daten = date('Y-m-d', strtotime($request->date));
            $data = Transaction::where('created_at', $daten)->where([['expense', '<=', 0], ['price_material', '!=', null]])->orWhere('expense', null)->orderBy('id', 'DESC')->with(['material', 'gosek'])->get();
            return Datatables::of($data)
                    ->editColumn('material_id', function ($row) {
                        return $row->material ? $row->material->name : "";
                    })
                    ->editColumn('price_material', function ($row) {
                        return Rupiah($row->price_material);
                    })
                    ->addIndexColumn()
                    ->addColumn('gosek', function($row){
                        return $row->gosek ? Rupiah($row->gosek->expense) : '';
                    })
                    ->addColumn('action', function($row){
                        $btn = '';
                        if(Auth::user()->can('isCashier')){
                            $btn = ' <a href="' .route('cashier.transaction.edit', $row->id). '" class=" btn btn-primary btn-sm my-1">Edit</a>';
                            $btn .= ' <a href="javascript:void(0)" id="delete" onClick="removeItem(' .$row->id. ')" class=" btn btn-danger btn-sm my-1">Delete</a>';
                        }
                        return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
            // return $request->date;

        }

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $transactions = Transaction::orderBy('created_at', 'DESC')->get()->groupBy(function($data) {
            return $data->created_at->format('d-m-Y');
        });;
        return view('cashier.transaction.index', compact('transactions'));
        // dd($transaction);

    }


    // public function create_date()
    // {
    //     return view('cashier.transaction.create_date_transaction');
    // }

    public function create(Request $request)
    {
        $materials = Material::all();
        $date=$request->date;
        return view('cashier.transaction.create', compact('date', 'materials'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(TransactionRequestCreate $request)
    {
        DB::beginTransaction();

        try {

            // dd($request->date);

            $data = array(
                'created_at' => $request->date ? date('Y-m-d', strtotime($request->date)) :  date('Y-m-d'),
                'vehicle_number' => $request->vehicle_number,
                'vehicle' => $request->vehicle,
                'type_material' => $request->type_material,
                'material_id' => $request->material_id,
                'price_material' => $request->price_material ? str_replace(".","",  $request->price_material)  : 0,
                'nomor' => $request->nomor
            );

            $transaction = Transaction::create($data);

            if($request->gosek != null || $request->gosek != ''){
                $expense = array(
                    'created_at' => $request->date ? date('Y-m-d', strtotime($request->date)) :  date('Y-m-d'),
                    'expense' =>  $request->gosek  ? str_replace(".","",  $request->gosek)  : 0,
                    'transaction_id' => $transaction->id
                );
                  // create gosek
                Gosek::create($expense);
            }

               // penjualan total - gosek * 25%

            $pemilik = Transaction::where('created_at',date('Y-m-d', strtotime($request->date)))->where('vehicle_number', 'pemilik' )->first();
            $sum = 0;
            if(!is_null($pemilik)){
                $t_transaction = Transaction::where('created_at',date('Y-m-d', strtotime($request->date)))->where('expense', 0)->get();
                $t_transaction = json_decode($t_transaction, true);
                $sum_transaction = array_sum(array_map(function($var) {
                    return $var['price_material'];
                }, $t_transaction));



                            // // get trasaksi gosek
                $t_gosek = Gosek::where('created_at', date('Y-m-d', strtotime($request->date)))->get();
                $t_gosek = json_decode($t_gosek, true);
                if(!is_null(($t_gosek))){
                    $sum_gosek = array_sum(array_map(function($var) {
                        return $var['expense'];
                    }, $t_gosek));

                }

                $sum = ($sum_transaction - $sum_gosek) *( 25/100);
                // $pemilik->update(['expense' => $sum]);
                Transaction::where('created_at',date('Y-m-d', strtotime($request->date)))->where('vehicle_number', 'pemilik' )
                            ->update(['expense' => $sum]);
            }


            DB::commit();
            return redirect()->route('cashier.transaction.index')->with('success', 'Success');
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);
            return redirect()->back();
        }

        // $t_transaction = Transaction::where('created_at',date('Y-m-d', strtotime($request->date)))->where('expense', 0)->get();
        //     $t_transaction = json_decode($t_transaction, true);
        //     $sum_transaction = array_sum(array_map(function($var) {
        //         return $var['price_material'];
        // }, $t_transaction));

        // $t_gosek = Gosek::where('created_at', date('Y-m-d', strtotime($request->date)))->get();
        // $t_gosek = json_decode($t_gosek, true);
        // if(!is_null(($t_gosek))){
        //     $sum_gosek = array_sum(array_map(function($var) {
        //         return $var['expense'];
        //     }, $t_gosek));

        // }

        // $sum = ($sum_transaction - $sum_gosek) *( 25/100);
        // // $pemilik->update(['expense' => $sum]);
        // Transaction::where('created_at',date('Y-m-d', strtotime($request->date)))->where('vehicle_number', 'pemilik' )
        //             ->update(['expense' => $sum]);
        // dd($sum);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($date)
    {
        $daten = date('Y-m-d', strtotime($date));
        $transactions = Transaction::where('created_at', $daten)->where('expense', 0)->orderBy('id', 'DESC')->get();

        return view('cashier.transaction.show', compact('transactions', 'date'));
    }


    public function expense($date)
    {
        $daten = date('Y-m-d', strtotime($date));
        $expenses = Transaction::where('created_at', $daten)->where('expense', '!=', 0)->get();
        // dd($expenses);
        return view('cashier.transaction.expense', compact('date', 'expenses'));
    }

    public function expense_store(Request $request)
    {
        // return view('cashier.transaction.expense', compact('date'));
        // dd($request->all());
        $type_expense = ['operator','kasir','helper','jalan 40', 'pemilik','jalan desa', 'lain-lain', 'solar'];
        $sum_transaction =0;
        $sum_gosek = 0;
        // pemilik rumusa
        // penjualan total - gosek * 25%
        $t_transaction = Transaction::where('created_at',date('Y-m-d', strtotime($request->date)))->where('expense', 0)->get();
        $t_transaction = json_decode($t_transaction, true);
        $sum_transaction = array_sum(array_map(function($var) {
            return $var['price_material'];
        }, $t_transaction));



                    // // get trasaksi gosek
        $t_gosek = Gosek::where('created_at', date('Y-m-d', strtotime($request->date)))->get();
        $t_gosek = json_decode($t_gosek, true);
        if(!is_null(($t_gosek))){
            $sum_gosek = array_sum(array_map(function($var) {
                return $var['expense'];
            }, $t_gosek));


        }

        $sum = ($sum_transaction - $sum_gosek) *( 25/100);

        foreach ($type_expense as $key => $value) {
            $data[$key] = [
                'vehicle_number' => $value,
                'expense' => $key == 4 ?( $sum  ? str_replace(".","",  $sum)  : 0 ) : ($request->expense[$key]  ? str_replace(".","",   $request->expense[$key])  : 0),
                'created_at' => date('Y-m-d', strtotime($request->date))
            ];
        }

        // dd($sum_gosek);

        $row = Transaction::where('created_at', date('Y-m-d', strtotime($request->date) ))
                                    ->where( function($query) {
                                        $query->whereIn('vehicle_number', $this->type_expense);
                                    });

        if($row->count() != 8){
            Transaction::insert($data);
        }else{
        //    $row->update($data);
            $row->delete();
            $row->insert($data);
        }

        return redirect()->route('cashier.transaction.index')->with('success', 'Success');
    }
    public function edit($id)
    {
        $materials = Material::all();
        $transaction = Transaction::with('gosek')->findOrFail($id);
        return view('cashier.transaction.edit', compact('transaction', 'materials'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        DB::beginTransaction();

        try {
            $transaction = Transaction::findOrFail($id);

            $data = array(
                'created_at' => $request->date ? date('Y-m-d', strtotime($request->date)) :  date('Y-m-d'),
                'vehicle_number' => $request->vehicle_number,
                'vehicle' => $request->vehicle,
                'type_material' => $request->type_material,
                'material_id' => $request->material_id,
                'price_material' =>  $request->price_material ? str_replace(".","",  $request->price_material)  : 0,
                'nomor' => $request->nomor
            );

            $transaction->update($data);

            if($request->gosek != null || $request->gosek != ''){
                $expense = array(
                    'created_at' => $request->date ? date('Y-m-d', strtotime($request->date)) :  date('Y-m-d'),
                    'expense' =>   $request->gosek  ? str_replace(".","",  $request->gosek)  : 0,
                    'transaction_id' => $transaction->id
                );

                $gosek = Gosek::where('transaction_id',$transaction->id)->first();

                if (!is_null($gosek)) {
                    $gosek->update($expense);
                }else{
                    Gosek::create($expense);
                }
            }

            $pemilik = Transaction::where('created_at',date('Y-m-d'. strtotime($request->date)))->where('vehicle_number', 'pemilik' )->first();
            $sum = 0;
            if(!is_null($pemilik)){
                $t_transaction = Transaction::where('created_at',date('Y-m-d'. strtotime($request->date)))->where('expense', 0)->get();
                $t_transaction = json_decode($t_transaction, true);
                $sum_transaction = array_sum(array_map(function($var) {
                    return $var['price_material'];
                }, $t_transaction));



                            // // get trasaksi gosek
                $t_gosek = Gosek::where('created_at', date('Y-m-d'. strtotime($request->date)))->get();
                $t_gosek = json_decode($t_gosek, true);
                if(!is_null(($t_gosek))){
                    $sum_gosek = array_sum(array_map(function($var) {
                        return $var['expense'];
                    }, $t_gosek));

                }

                $sum = ($sum_transaction - $sum_gosek) *( 25/100);
                // $pemilik->update(['expense' => $sum]);
                Transaction::where('created_at',date('Y-m-d'. strtotime($request->date)))->where('vehicle_number', 'pemilik' )
                            ->update(['expense' => $sum]);


            }
            // dd($sum);
            // dd($sum_gosek);

            DB::commit();
            return redirect()->back()->with('success', 'Success');
        } catch (\Throwable $th) {
            DB::rollBack();
            // dd($th);
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::beginTransaction();
        try{
            $transaction = Transaction::findOrFail($id);
            $date = $transaction->created_at;
            $transaction->delete();
            $t_transaction = Transaction::where('created_at', $date)->where('expense', 0)->get();
            $t_transaction = json_decode($t_transaction, true);
            $gosek = Gosek::where('transaction_id',$transaction->id)->first();

            if (!is_null($gosek)) {
                $gosek->delete();
            }


            $pemilik = Transaction::where('created_at',date('Y-m-d', strtotime($date)))->where('vehicle_number', 'pemilik' )->first();
            $sum = 0;

            if(!is_null($pemilik)){
                $t_transaction = Transaction::where('created_at',date('Y-m-d', strtotime($date)))->where('expense', 0)->get();
                $t_transaction = json_decode($t_transaction, true);
                $sum_transaction = array_sum(array_map(function($var) {
                    return $var['price_material'];
                }, $t_transaction));

                            // // get trasaksi gosek
                $t_gosek = Gosek::where('created_at', date('Y-m-d', strtotime($date)))->get();
                $t_gosek = json_decode($t_gosek, true);
                if(!is_null(($t_gosek))){
                    $sum_gosek = array_sum(array_map(function($var) {
                        return $var['expense'];
                    }, $t_gosek));

                }

                // dd($sum_gosek);

                $sum = ($sum_transaction - $sum_gosek) *( 25/100);
                $pemilik = Transaction::where('created_at',date('Y-m-d', strtotime($date)))->where('vehicle_number', 'pemilik' )
                                ->update(['expense' => $sum]);

                // dd($pemilik);
            }
            DB::commit();
        } catch (\Throwable $th) {
            // dd($th);
            DB::rollBack();
        }

    }


    public function report(Request $request)
    {
        // dd($request->all());
        $date = date('Y-m-d', strtotime($request->date));
        $transactions = Transaction::where('created_at', $date)->where([['expense', '<=', 0], ['price_material', '!=', null]])->get();
        $transactions_expense = Transaction::where('created_at', $date)->where(function ($query){
            $query->where('price_material', '0');
            $query->orWhere('price_material', '=', null);
        })->get();
        // dd($transactions_expense);

        $t_gosek = Gosek::where('created_at', date('Y-m-d', strtotime($request->date)))->get();
        $t_gosek = json_decode($t_gosek, true);

        $sum = array_sum(array_map(function($var) {
            return $var['price_material'];
        }, json_decode($transactions, true)));

        $sum_expense = array_sum(array_map(function($var) {
            return $var['expense'];
        },json_decode( $transactions_expense, true)));


        $sum_gosek=0;
        if(!is_null(($t_gosek))){
            $sum_gosek = array_sum(array_map(function($var) {
                return $var['expense'];
            }, $t_gosek));

            $sum_expense+=$sum_gosek;
        }


        $pdf = PDF::loadview('cashier.transaction.report', [
            'transactions' => $transactions,
            'transactions_expense' => $transactions_expense,
            'date' => $request->date,
            'total' => $sum,
            'total_expense' => $sum_expense,
            'gosek' => $sum_gosek
        ]);
        return $pdf->stream();
    }
}
