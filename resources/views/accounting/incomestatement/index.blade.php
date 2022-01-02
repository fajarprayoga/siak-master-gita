@extends('admin.template')

@section('content')
    {{-- <h1>@lang('global.incomestatement.incomestatement')</h1> --}}
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3 border-right-0">@lang('global.incomestatement.incomestatement')</div>
        <div class="ms-auto">
            <div class="btn-group">
                @can('isAccounting')
                <a href="{{ route('accounting.incomestatement.create') }}" class="text-white btn btn-primary ">@lang('global.app.add')</a>
                @endcan
            </div>
        </div>
    </div>
    {{-- <a href="{{ route('admin.incomestatement.create') }}" class="btn btn-success btn-md my-1">@lang('global.app.add') @lang('global.incomestatement.title')</a> --}}
    <div class="card">
        <div class="card-body">
            <div class="table-responsive mt-3">
                <table class="table align-middle table-bordered  data-table">
                    <thead class="table-secondary">
                        <tr>
                            <th>No</th>
                            <th>@lang('global.incomestatement.register')</th>
                            <th>@lang('global.incomestatement.title')</th>
                            {{-- <th>@lang('global.incomestatement.detail')</th> --}}
                            <th width="100px">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script type="text/javascript">
        $(function () {

            var table = $('.data-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('accounting.incomestatement.incomestatementdata') }}",
                columns: [
                    {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                    {data: 'register', name: 'register'},
                    {data: 'title', name: 'title'},
                    // {data : 'details', name : 'details'},
                    {data: 'action', name: 'action', orderable: false, searchable: false},
                ]
            });

        });

        // $('#delete').on( 'draw.dt', function () {
        //     alert( 'Table redrawn' );
        // } );
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
                        url:' {{ url("/accounting/incomestatement")}}/' + id,
                        type:'delete',
                        data:'_token = <?php echo csrf_token() ?>',
                        success:function(data) {
                            //   $("#msg").html(data.msg);
                            // console.log(data);
                            $('.data-table').DataTable().ajax.reload();
                            swal("Delete Success", {
                                icon: "success",
                            });
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
    </script>
@endsection