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
                   <form action="{{ route('accounting.journal.update', $journal->id) }}" method="POST">
                         @csrf
                         @method('PUT')
                        <div class="mb-3">
                            <label for="date" class="form-label">@lang('global.journal.register')</label>
                            {{-- <input class="result form-control" data-date-format="DD MMMM YYYY" type="text" data-dtp="dtp_abBgN" id="date" name="register" value="{{ old($journal->register) ? old($journal->register) : $journal->register }}" required > --}}
                            <input class="result form-control" type="text" id="date" name="register" data-dtp="dtp_abBgN" value="{{ old($journal->register) ? old((new Datetime($journal->register))->format('d-m-Y')) : (new Datetime($journal->register))->format('d-m-Y') }}" required>
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">@lang('global.journal.title')</label>
                            <input class="form-control" type="text" id="title" name="title"  value="{{ old($journal->title) ? old($journal->title) : $journal->title }}" required >
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">@lang('global.journal.description')</label>
                            <textarea class="form-control " rows="3" name="description" id="description" required>{{ old($journal->description) ? old($journal->description) : $journal->description }}</textarea>
                        </div>
                        <h5 class="my-2">@lang('global.journal.account')</h5>
                        <table class="table text-center">
                            <thead class="text-center">
                                <tr>
                                    <th>Account</th>
                                    <th>Type</th>
                                    <th>Amount</th>
                                    <th>Keterangan</th>
                                </tr>
                            </thead>
                            <tbody id="baseRow">
                                @foreach ($journal->journal_detail as $index => $detail)
                                <tr class="tr">
                                    <td>
                                        <select name="accounts[]" class="select2 form-control  accounts">
                                            <option value="">-- choose account --</option>
                                            @foreach ($accounts as $account )
                                                <option value="{{ $account->id }}"  {{ $detail->account->id == $account->id ? 'selected' : '' }} >{{"$account->code $account->name"}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select  name="types[]" class="form-control select2 types" onchange="funTypes()">
                                                <option value="debit"  {{ $detail->types == 'debit' ? 'selected' : '' }} >
                                                    Debit
                                                </option>
                                                <option value="credit" {{ $detail->types == 'credit' ? 'selected' : '' }} >
                                                    Credit
                                                </option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="0" min="0" name="amount[]" id="" value="{{ $detail->amount }}" class="form-control amount" >
                                    </td>
                                    <td>
                                        <textarea name="description_journal_detail[]" class="form-control" id="description" cols="30" rows="1" required>{{ $detail->description }}</textarea>
                                    </td>
                                    @if ($index > 1)
                                        <td>
                                            <div class="btn btn-danger delete text-center p-3" onclick="removeItem({{ $detail->id }})" >
                                                <div class='d-flex align-items-center '>
                                                    <i class="lni lni-trash"></i>
                                                </div>
                                            </div>
                                        </td>
                                    @endif
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="mb-2">
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
                           <div class="col-md-12">
                                <a id="addRow " class="btn btn-success " style="color: white" onclick="addRow()">+ Add Row</a>
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

        $(document).ready(() => {
            getTotal()
        })

        function funTypes(params) {
            var count = $('.tr').length;
            for (let index = 0; index < count; index++) {
                const types = $('.types option:selected');
                if(types[index].attributes.value.value != '' && types[index].attributes.value.value !=null){
                    $('.amount')[index].disabled=false;
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


        const removeItem =(id) => {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            swal({
                title: "Are you sure?",
                text: "File yang di Hapus tidak bisa di kembalikan !",
                icon: "warning",
                buttons: true,
                dangerMode: true,
                })
                .then((willDelete) => {
                if (willDelete) {
                    $.ajax({
                        url:' {{ url("/accounting/detail/delete")}}/' + id,
                        type:'delete',
                        data:'_token = <?php echo csrf_token() ?>',
                        success:function(data) {
                            //   $("#msg").html(data.msg);
                            // console.log(data);
                            $('.data-table').DataTable().ajax.reload();
                            swal("Delete Success", {
                                icon: "success",
                            });
                            location.reload()
                        },
                        error: function(err) {
                            swal("Delete Error!", {
                                icon: "error",
                            });
                            console.log(err);
                        }

                    });
                }
            });
        }

        function addRow() {
            // count++;
                // e.preventDefault();
                $('#baseRow').append(`
                    <tr class='tr' >
                        <td>
                            <select  name="accounts[]" class="form-control select2 accounts">
                                <option value="">-- choose account --</option>
                                @foreach ($accounts as $account )
                                    <option value="{{ $account->id }}">{{ "$account->code $account->name" }}</option>
                                @endforeach
                            </select>
                        </td>
                        <td>
                            <select  name="types[]" class="form-control select2 types" onChange="funTypes()">
                                <option value="">-- choose type --</option>
                                <option value="debit">
                                    Debit
                                </option>
                                <option value="credit" >
                                    Credit
                                </option>
                            </select>
                        </td>
                        <td>
                            <input type="text" placeholder = "0" name="amount[]" disabled  min="0" id="" class="form-control amount" >
                        </td>
                        <td>
                            <textarea name="description_journal_detail[]" class="form-control" id="" cols="30" rows="1" required></textarea>
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
            }
            $(document).on('click', '.delete', function(item) {
                $(this).closest('.tr').remove();
                getTotal();
            })



            $('#date').bootstrapMaterialDatePicker({ format : 'DD-MM-YYYY',time:false });

    </script>
@endsection
