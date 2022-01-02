@extends('admin.template')

@section('content')
    <style>
        .select2 {
            width: 200px
        }
    </style>
    <div class="row">
        <div class="col-xl-12 mx-auto">
            <h6 class="mb-0 text-uppercase">@lang('global.journal.title')</h6>
            <hr>
            <div class="card">
                <div class="card-body">
                   <form action="{{ route('accounting.journal.store') }}" method="POST">
                         @csrf
                        <div class="mb-3">
                            <label for="date" class="form-label">@lang('global.journal.register')</label>
                            {{-- <input class="form-control " data-date-format="DD MMMM YYYY" type="text" id="register" name="register" required > --}}
                            <input class="result form-control" type="text" id="date" name="register" data-dtp="dtp_abBgN" required>
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">@lang('global.journal.judul')</label>
                            <input class="form-control" type="text" id="title" name="title" required >
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">@lang('global.journal.description')</label>
                            <textarea class="form-control" rows="3" name="description" id="description" required> </textarea>
                        </div>
                        <h5 class="my-2">@lang('global.journal.account')</h5>
                        <table class="table text-center">
                            <thead class="text-center">
                                <tr>
                                    <th>Akun</th>
                                    <th>Tipe</th>
                                    <th>Nominal</th>
                                    <th>Keterangan</th>
                                </tr>
                            </thead>
                            <tbody id="baseRow">
                                    <tr class="tr">
                                        <td>
                                            <select name="accounts[]" class=" select2 accounts" required>
                                                <option value="">-- pilih --</option>
                                                @foreach ($accounts as $account )
                                                    <option value="{{ $account->id }}">{{ "$account->code $account->name" }}</option>
                                                @endforeach
                                            </select>
                                        </td>
                                        <td>
                                            <select  name="types[]" class=" select2 types " onchange="funTypes()" required>
                                                <option value="">-- pilih --</option>
                                                    <option value="debit">
                                                        Debit
                                                    </option>
                                                    <option value="credit" >
                                                        Credit
                                                    </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" min="0" name="amount[]" id="" disabled class="form-control amount" required>
                                        </td>
                                        <td>
                                            <textarea name="description_journal_detail[]" class="form-control" id="description" cols="30" rows="1" required></textarea>
                                        </td>
                                    </tr>
                                    <tr class="tr">
                                        <td>
                                            <select name="accounts[]" class=" select2 accounts" required>
                                                <option value="">-- pilih --</option>
                                                @foreach ($accounts as $account )
                                                    <option value="{{ $account->id }}">{{ "$account->code $account->name" }}</option>
                                                @endforeach
                                            </select>
                                        </td>
                                        <td>
                                            <select  name="types[]" class=" select2 types"  onchange="funTypes()" required>
                                                <option value="">-- pilih --</option>
                                                    <option value="debit">
                                                        Debit
                                                    </option>
                                                    <option value="credit" >
                                                        Credit
                                                    </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" name="amount[]" id=""  disabled class="form-control amount" required>
                                        </td>
                                        <td>
                                            <textarea name="description_journal_detail[]" class="form-control" id="" cols="30" rows="1"></textarea>
                                        </td>
                                        <td> </td>
                                        <td> </td>
                                    </tr>
                                    {{-- <tr>
                                        <td><a class="btn bnt-sm btn-primary" onclick="addRow()" >Tambah Kolom</a></td>
                                        <td></td>
                                        <td class="text-right"><button class="btn btn-sm btn-danger">Hapus Kolom</button></td>
                                    </tr> --}}
                            </tbody>
                        </table>
                        <div class="col-md-12">
                             <a id="addRow " class="btn btn-success " style="color: white" onclick="addRow()">+ Tambah</a>
                        </div>
                        <div class="mb-2 mt-4">
                            <div class="col-md-12">
                               <table class="table">
                                   <tbody>
                                       <tr>
                                           <td>Debit Total </td>
                                           <td>:</td>
                                           <td>Rp. <span id="debit-total">0</span></td>
                                       </tr>
                                       <tr>
                                            <td>Credit Total </td>
                                            <td>:</td>
                                            <td >Rp. <span id="credit-total">0</span></td>
                                        </tr>
                                   </tbody>
                               </table>
                            </div>
                            {{-- <div class="col-md-6 text-right">
                                <a id="deleteRow" class="btn btn-danger " style="color: white">+ Add Row</a>
                           </div> --}}
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary btn-submit" disabled>Simpan</button>
                        </div>

                   </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script type="text/javascript">

        const total = [];
        const valueTypes =[];

        function funTypes(params) {
            var count = $('.tr').length;
            for (let index = 0; index < count; index++) {
                const types = $('.types option:selected');
                if(types[index].attributes.value.value != '' && types[index].attributes.value.value !=null){
                    $('.amount')[index].disabled=false;
                    // console.log($('.amount')[0].value=100);
                    valueTypes[index]=types[index].attributes.value.value;
                }else{
                    $('.amount')[index].disabled=true;
                    $('.amount')[index].value=0;
                    valueTypes[index]='';
                }
            }
            getTotal();
        }

        function getTotal(){
            var totaldebit = 0;
            var totalcredit = 0;
            var amount = $(".amount").map(function(index, value){
                var row = $(value).closest('.tr')
                var type = $(row).find('.types')
                if($(type).val() == "debit"){
                    totaldebit += parseInt($(value).val() == ''? 0:$(value).val().split('.').join(""))
                }else if($(type).val() == "credit"){
                    totalcredit += parseInt($(value).val() == ''? 0:$(value).val().split('.').join(""))
                }

                $(value).val(function(index, item) {
                    return item
                    .replace(/\D/g, "")
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ".")
                    ;
                });

                $('#debit-total').text(totaldebit)
                $('#credit-total').text(totalcredit)
                if(isNaN($('#debit-total').text())){
                    $('#debit-total').text(0)
                }
                if(isNaN($('#credit-total').text())){
                    $('#credit-total').text(0)
                }
                $('#debit-total').text(function(index, item) {
                    return item
                    .replace(/\D/g, "")
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ".")
                    ;
                });
                $('#credit-total').text(function(index, item) {
                    return item
                    .replace(/\D/g, "")
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ".")
                    ;
                });

                if(totaldebit == totalcredit){
                    $('.btn-submit').prop('disabled', false)
                }else{
                    $('.btn-submit').prop('disabled', true)
                }
            }).get();
        }

        $(document).on('keyup','.amount',function(){

            getTotal();
        });

        // $('.submit')



        function addRow() {
            // count++;
                // e.preventDefault();
                $('#baseRow').append(`
                    <tr class='tr' >
                        <td>
                            <select  name="accounts[]" class=" select2 accounts" required>
                                <option value="">-- choose account --</option>
                                @foreach ($accounts as $account )
                                    <option value="{{ $account->id }}">{{ "$account->code $account->name" }}</option>
                                @endforeach
                            </select>
                        </td>
                        <td>
                            <select  name="types[]" class=" select2 types" onChange="funTypes()" required>
                                <option value="">-- pilih --</option>
                                <option value="debit">
                                    Debit
                                </option>
                                <option value="credit" >
                                    Credit
                                </option>
                            </select>
                        </td>
                        <td>
                            <input type="text" name="amount[]" disabled  min="0" id="" class="form-control amount" required>
                        </td>
                        <td>
                            <textarea name="description_journal_detail[]" class="form-control" id="" cols="30" rows="1"></textarea>
                        </td>
                        <td>
                            <div class="btn btn-danger delete text-center p-3" >
                                <div class='d-flex align-items-center'>
                                    <i class="lni lni-trash"></i>
                                </div>
                            </div>
                        </td>
                    </tr>
                `)
                $('.select2').select2({
                    placeholder: "Pilih"
                })
                // console.log(row.outerHTML);
            }
            $(document).on('click', '.delete', function() {
                $(this).closest('.tr').remove();
                getTotal();
            })

            $('#date').bootstrapMaterialDatePicker({ format : 'DD-MM-YYYY',time:false });
    </script>
@endsection
